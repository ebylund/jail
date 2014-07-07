class JailsController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	def main
		url = "https://news.washeriff.net/wp-content/reports/booking/mainbook.html"
		doc = Nokogiri::HTML(open(url))
		@body = doc.css('p')

	end

end
