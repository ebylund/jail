class BookeeSerializer < ActiveModel::Serializer
	embed :ids, include: true


	attributes :id, :name, :address, :picture, :arrest_datetime, :status, :pcf_number, :city_state, :officer, :agency, :created_at, :updated_at, :address_lat, :address_lon
	has_many :convict_offenses
end
