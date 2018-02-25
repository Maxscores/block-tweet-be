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

  def build_with_id(query, max_id)
    google_package = GooglePackage.new
    tweets = TwitterService.client.search("#{query}", max_id: max_id, lang: 'en', result_type: "mixed")
    normalizer = TweetNormalizer.new()
    # TwitterSearchHistory.create(normalizer.save)
    tweets.each do |tweet|
      google_package.content << normalizer.normalize(tweet)
    end
    google_package
  end
end
