class ConvictOffense < ActiveRecord::Base
  belongs_to :bookee
  belongs_to :crime
end
