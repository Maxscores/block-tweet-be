namespace :remove_duplicates do
  task all: :environment do
    group_hour_sentiment = GroupHourSentiment.new
    bitcoin = group_hour_sentiment.bitcoin.reduce({}) do |result, sentiment|
      result[sentiment.hours_ago] = [] if result[sentiment.hours_ago].nil?
      result[sentiment.hours_ago] << sentiment.id
      result
    end
    bitcoin.each do |hours, sentiment_ids|
      if sentiment_ids.length > 1
        sentiment_ids[1..-1].each do |sentiment_id|
          HourSentiment.find(sentiment_id).destroy
          puts "Sentiment #{sentiment_id} Deleted"
        end
      end
    end

    ethereum = group_hour_sentiment.ethereum.reduce({}) do |result, sentiment|
      result[sentiment.hours_ago] = [] if result[sentiment.hours_ago].nil?
      result[sentiment.hours_ago] << sentiment.id
      result
    end
    ethereum.each do |hours, sentiment_ids|
      if sentiment_ids.length > 1
        sentiment_ids[1..-1].each do |sentiment_id|
          HourSentiment.find(sentiment_id).destroy
          puts "Sentiment #{sentiment_id} Deleted"
        end
      end
    end

    blockchain = group_hour_sentiment.blockchain.reduce({}) do |result, sentiment|
      result[sentiment.hours_ago] = [] if result[sentiment.hours_ago].nil?
      result[sentiment.hours_ago] << sentiment.id
      result
    end
    blockchain.each do |hours, sentiment_ids|
      if sentiment_ids.length > 1
        sentiment_ids[1..-1].each do |sentiment_id|
          HourSentiment.find(sentiment_id).destroy
          puts "Sentiment #{sentiment_id} Deleted"
        end
      end
    end

    crypto = group_hour_sentiment.crypto.reduce({}) do |result, sentiment|
      result[sentiment.hours_ago] = [] if result[sentiment.hours_ago].nil?
      result[sentiment.hours_ago] << sentiment.id
      result
    end
    crypto.each do |hours, sentiment_ids|
      if sentiment_ids.length > 1
        sentiment_ids[1..-1].each do |sentiment_id|
          HourSentiment.find(sentiment_id).destroy
          puts "Sentiment #{sentiment_id} Deleted"
        end
      end
    end
  end
end
