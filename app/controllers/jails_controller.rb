class JailsController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	def main
		url = "https://news.washeriff.net/inmate-information/bookings/"
		doc = Nokogiri::HTML(open(url))
		@body = [] #doc.css('.name p').text[/([A-Z]*)/]
		@table = []
		@charge = []
		@picture = []

		doc.css("table").each do |bookee|
			h = {}
			h[:charge] = bookee.at_css('.charge')
			separate = bookee.at_css('.name p')
			h[:address] = separate.to_s.split('<br>')

			@table << h

			# @body << table.at_css('.name p').text[/([A-Z]*)/]	
			# @picture << table.at_css('.picture img')[//]
			# @charge << table.at_css('.charge')
		end
		
	end

end
