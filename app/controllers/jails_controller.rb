class JailsController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	def main
		url = "https://news.washeriff.net/inmate-information/bookings/"
		doc = Nokogiri::HTML(open(url))
		@body = [] #doc.css('.name p').text[/([A-Z]*)/]
		@personTable = []
		@charge = []


		doc.css("table").each do |bookee|
			h = {}
			h[:charge] = bookee.at_css('.charge')
			h[:name] = bookee.at_css('.name p b').text
			separate = bookee.at_css('.name p')
			paraElement = separate.to_s.gsub(/<\/?br\/?>/, "").split("\n")

			h[:address] = paraElement[1].strip.gsub("Address: ", "")
			h[:city] = paraElement[2].strip.gsub("City/State: ", "")
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
			# @picture = bookee.at_css('.picture img[src]')

			@personTable << h

			# @body << table.at_css('.name p').text[/([A-Z]*)/]	
			# @picture << table.at_css('.picture img')[//]
			# @charge << table.at_css('.charge')
		end
		
	end

end
