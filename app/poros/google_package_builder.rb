class GooglePackageBuilder
  def self.build(query)
    google_package = []
    end_tweet = TwitterSearchHistory.last.end_tweet_id
    tweets = TwitterService.search("#{query}", since_id: end_tweet)
    normalizer = TweetNormalizer.new()
    TwitterSearchHistory.create(normalizer.save)
    tweets.each do |tweet|
      google_package.text << normalizer.normalize(tweet)
    end
    google_package
  end

end
