class JailsController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	def main
		url = "https://news.washeriff.net/inmate-information/bookings/"
		doc = Nokogiri::HTML(open(url))
		@body = [] #doc.css('.name p').text[/([A-Z]*)/]
		@table = []
		@charge = []

		doc.css("table").each do |table|
			@body << table

			# @body << table.at_css('.name p').text[/([A-Z]*)/]	
			# @table << table.at_css('.picture img')
			@charge << table.at_css('.charge')
		end
	end

end
