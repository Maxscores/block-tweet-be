class GooglePackageBuilder
  def build(query)
    google_package = GooglePackage.new
    tweets = TwitterService.search("#{query}")
    normalizer = TweetNormalizer.new()
    # TwitterSearchHistory.create(normalizer.save)
    tweets.each do |tweet|
      google_package.content << normalizer.normalize(tweet)
    end
    google_package
  end
end
