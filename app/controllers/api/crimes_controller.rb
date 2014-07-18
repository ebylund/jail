class Api::CrimesController < ApplicationController

	respond_to :json

	def index
		@crimes = Crime.all
		respond_with @crimes
	end

	def show
		@crime = Crime.find(params[:id])
    	respond_with @crime
	end

	def update
		@crime = Crime.find(params[:id])
		@crime.update_attributes(safe_params)
		respond_with @crime
	end

end
