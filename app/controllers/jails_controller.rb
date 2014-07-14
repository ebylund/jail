class JailsController < ApplicationController
	require 'open-uri'
	require 'nokogiri'

	def main
		url = "https://news.washeriff.net/inmate-information/bookings/"
		doc = Nokogiri::HTML(open(url))
		@body = [] #doc.css('.name p').text[/([A-Z]*)/]
		@personTable = []
		


		#loops through each table to parse out the information for each bookee

		doc.css("table").each do |bookee|
			h = {}
			#string of last name for each bookee
			@lastName = bookee.at_css('.name p b').to_s.gsub(/<\/?b\/?>/, "").split(",")[0]

			#selects each image tag and removes all white space on the end of the link
			picture = bookee.at_css('.picture img[src]').to_s.strip.gsub(/%20/,"")

			# the image url to download the image
			image_location = picture[/https:\/\/([^\"]+)/]

			# the string of digits in the image url reformatted as a unique file identifier
			pic_str = image_location[/\/[\d]+\/[\d]+\/[\d]+/].gsub(/\//,"").to_s

			#downloads and saves images from image_location to the images file in the rails app

			# open(image_location) {|f|
			#    File.open( "app/assets/images/" + pic_str + ".jpg","wb") do |file|
			#      file.puts f.read
			#    end
			# }

			h[:charge] = bookee.css('.charge')
			h[:charge_details] = bookee.css('.chargedetails p')
			h[:name] = bookee.at_css('.name p b').text
			separate = bookee.at_css('.name p')
			paraElement = separate.to_s.gsub(/<\/?br\/?>/, "").split("\n")
			address = paraElement[1].strip.gsub("Address: ", "")

			if address == '/'
				h[:address] = "No Address"
			else
				h[:address] = address
			end

			city = paraElement[2].strip.gsub("City/State: ", "").strip

			if city == "/"
				h[:city] = "No City"
			else
				h[:city] = city
			end
			h[:number] = paraElement[3].strip.gsub("PCF Number: ", "")

			date_time = paraElement[4].strip.gsub("Arrest Date: ", "")
			
			date_time_array = date_time.split(" ")
			h[:date] = date_time_array[1]
			h[:time] = date_time_array[0]

			h[:officer] = paraElement[5].strip.gsub("Arrested By: ", "")
			h[:agency] = paraElement[6].strip.gsub("Agency: ", "")
			h[:status] = paraElement[7].strip
		
			# paraElement = 
			# @paraElement = paraElement.each { |x| puts x }
			# h[:info] = paraElement
			h[:picture] = bookee.at_css('.picture img[src]').to_s.strip.gsub(/%20/,"")

			# string = "https://news.washeriff.net/images/87/493187/14071114502200.JPG"
			# Bookee.attachment.upload = File.open(string)
			# @picture = bookee.at_css('.picture img[src]')

			@personTable << h

			# @body << table.at_css('.name p').text[/([A-Z]*)/]	
			# @picture << table.at_css('.picture img')[//]
			# @charge << table.at_css('.charge')
		end
		
	end

end
