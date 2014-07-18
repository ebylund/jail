class ConvictOffenseSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :court, :required_bond, :paid
  has_one :crime
  has_one :bookee
end
