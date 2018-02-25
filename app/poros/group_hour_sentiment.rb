class GroupHourSentiment
  include ActiveModel::Serialization

  attr_reader :crypto, :blockchain, :bitcoin, :ethereum

  def crypto
    HourSentiment.where(query: 'crypto')
  end

  def blockchain
    HourSentiment.where(query: 'blockchain')
  end

  def bitcoin
    HourSentiment.where(query: 'bitcoin')
  end

  def ethereum
    HourSentiment.where(query: 'ethereum')
  end
end
