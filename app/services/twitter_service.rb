class TwitterService
  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end

  def self.search(query)
    client.search("#{query}", lang: 'en', result_type: 'popular')
  end

  def self.step_backwards(query, max_id = 9675927855190220810, start_date = HourSentiment.last.created_at)
    tweets = client.search("#{query}", lang: 'en', result_type: "mixed", max_id: max_id)
    sorted = tweets.sort_by {|tweet| Time.now - tweet.created_at}
    selected_tweet = sorted.first
    if (start_date - selected_tweet.created_at) > 3000
      start_date = selected_tweet.created_at
      bitcoin_package = GooglePackageBuilder.new.build_with_id("bitcoin", selected_tweet.id)
      puts "bitcoin packaged"
      bitcoin_sentiment = bitcoin_package.analyze
      HourSentiment.create!(score: bitcoin_sentiment.score,
                            magnitude: bitcoin_sentiment.magnitude,
                            query: "bitcoin",
                            created_at: selected_tweet.created_at)
      puts "bitcoin received"

      etherium_package =  GooglePackageBuilder.new.build_with_id("ethereum", selected_tweet.id)
      puts "ethereum packaged"
      etherium_sentiment = etherium_package.analyze
      HourSentiment.create!(score: etherium_sentiment.score,
                            magnitude: etherium_sentiment.magnitude,
                            query: "ethereum",
                            created_at: selected_tweet.created_at)

      blockchain_package = GooglePackageBuilder.new.build_with_id("blockchain", selected_tweet.id)
      puts "blockchain packaged"
      blockchain_sentiment = blockchain_package.analyze
      HourSentiment.create!(score: blockchain_sentiment.score,
                            magnitude: blockchain_sentiment.magnitude,
                            query: "blockchain",
                            created_at: selected_tweet.created_at)

      crypto_package = GooglePackageBuilder.new.build_with_id("crypto", selected_tweet.id)
      puts "crypto packaged"
      crypto_sentiment = crypto_package.analyze
      HourSentiment.create!(score: crypto_sentiment.score,
                            magnitude: crypto_sentiment.magnitude,
                            query: "crypto",
                            created_at: selected_tweet.created_at)
    end
    puts "New Start Date #{selected_tweet.created_at}"
    puts "New start ID #{selected_tweet.id - 2000000000000}"
    TwitterService.step_backwards(query, selected_tweet.id - 2000000000000, start_date)
  end
end
