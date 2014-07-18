class Crime < ActiveRecord::Base
	has_many :convict_offenses, dependent: :destroy
	has_many :bookees, through: :convict_offenses
end
