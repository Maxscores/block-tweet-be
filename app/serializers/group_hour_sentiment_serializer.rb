class GroupHourSentimentSerializer < ActiveModel::Serializer
  attributes :bitcoin, :ethereum, :blockchain, :crypto

  has_many :bitcoin
  has_many :ethereum
  has_many :blockchain
  has_many :crypto
end
