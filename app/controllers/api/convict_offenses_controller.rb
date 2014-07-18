class Api::ConvictOffensesController < ApplicationController

	respond_to :json

	def index
		@crime_offenses = CrimeOffense.all
		respond_with @crime_offenses
	end

	def show
		@crime_offense = CrimeOffense.find(params[:id])
    	respond_with @crime_offense
	end

	def update
		@crime_offense = CrimeOffense.find(params[:id])
		@crime_offense.update_attributes(safe_params)
		respond_with @crime_offense
	end
	
end
