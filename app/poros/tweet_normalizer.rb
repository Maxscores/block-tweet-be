class TweetNormalizer
  def normalize(tweet)
    text = tweet.full_text.to_s
    text * (((tweet.favorite_count * 0.001 ) + (tweet.retweet_count * 0.01) + (tweet.user.followers_count * 0.005))/1000).ceil
  end
end
