class Bookee < ActiveRecord::Base


	has_many :convict_offenses, dependent: :destroy
	has_many :crimes, through: :convict_offenses
	require 'open-uri'
	require 'nokogiri'
	geocoded_by :full_street_address, :latitude => :address_lat, :longitude => :address_lon
	after_validation :geocode
	validates_uniqueness_of :pcf_number, conditions: -> { where.not(status: 'archived') }

	def self.import_convicts
		url = "https://news.washeriff.net/inmate-information/bookings/"
		doc = Nokogiri::HTML(open(url))
		doc.css("table").each do |table|
		#loops through each table to parse out the information for each bookee
			convict = Bookee.new
			convict.name = table.at_css('.name p b').text
			
		#selects each image tag and removes all white space on the end of the link
			picture = table.at_css('.picture img[src]').to_s.strip.gsub(/%20/,"")

		# the image url to download the image
			image_page_location = picture[/https?:\/\/([^\"]+)/]

		# the string of digits in the image url reformatted as a unique file identifier

			image_file_name_complete = image_page_location[/\/[\d]+\.[A-z]{0,3}/].gsub(/\//,"").to_s
			convict.picture = image_file_name_complete



			#downloads and saves images from image_location to the images file in the rails app

			unless File.exists?("app/assets/images/" + image_file_name_complete)
				open(image_page_location) {|f|
				   File.open( "app/assets/images/" + image_file_name_complete ,"wb") do |file|

				     file.puts f.read
				   end
				}
			end
		#begins the parsing of the paragraph to use the bookees personal info
			separate = table.at_css('.name p')
		#makes and array of personal bookee information later to be parsed
			paraElement = separate.to_s.gsub(/<\/?br\/?>/, "").split("\n")
			convict.pcf_number = paraElement[3].strip.gsub("PCF Number: ", "")
			next if Bookee.find_by(pcf_number: convict.pcf_number)
		#sets city and address from the array so there can be form control in the view
			address = paraElement[1].strip.gsub("Address: ", "").gsub(/\s+/, " ")
			city = paraElement[2].strip.gsub("City/State: ", "").gsub(/\s+/, " ")
		#simple form control for city and address
			if address == "/"
				convict.address = "No Address"
			else
				convict.address = address
			end

			if city == "/"
				convict.city_state = "No City"
			else
				convict.city_state = city
			end
		# sets the arrest date and time into the proper type of :datetime
			date_time = paraElement[4].strip.gsub("Arrest Date: ", "").strip.to_s
			convict.arrest_datetime = DateTime.strptime(date_time, '%H:%M:%S %m/%d/%Y')

		# sets officer and angency
			convict.officer = paraElement[5].strip.gsub("Arrested By: ", "")
			convict.agency = paraElement[6].strip.gsub("Agency: ", "")


		# b[:officer] = paraElement[5].strip.gsub("Arrested By: ", "")
			# b[:agency] = paraElement[6].strip.gsub("Agency: ", "")
			convict.status = paraElement[7].gsub(/(<[^>]*>)|\n|\t/, "").strip

			convict.save
			is_first_tr = true

			table.css("tr").each do |tr|
				if is_first_tr
					is_first_tr = false
					next
				end

				charge = tr.at_css('.charge')

				charge_details_block = tr.at_css('.chargedetails p')
				#makes and array of personal bookee information later to be parsed
				charge_details_array = charge_details_block.to_s.gsub(/<\/?br\/?>|\t/, "").gsub(/(<[^>]*>)/, "").strip.split("\n")
				
				statute = charge_details_array[1].to_s.strip.gsub("Statute: ", "").strip
				offense = Crime.find_by(:statute => statute)
				unless offense 
					offense = Crime.new
					offense.statute = statute
					offense.name =charge.to_s.gsub(/(<[^>]*>)/, "").strip
					offense.classification = charge_details_array[0].to_s.strip.gsub("Crime Classification:", "").strip
					offense.save
				end


					convict_offense = ConvictOffense.new
					convict_offense.bookee_id = convict.id 
					convict_offense.crime_id = offense.id
					convict_offense.court = charge_details_array[2].to_s.strip.gsub("Court: ", "").strip
					convict_offense.required_bond = charge_details_array[3].to_s.strip.gsub("Required Bond: ", "").strip
					convict_offense.paid = charge_details_array[4].to_s.gsub("Paid:", "").strip

					convict_offense.save

			end
		
		end


	end
	def full_street_address
		[address, city_state].compact.join(', ')
	end


	def name=(name)
		super name.strip
	end

	def city=(city)
		super city.strip
	end

	def address=(address)
		super address.strip
	end
		
	
end
