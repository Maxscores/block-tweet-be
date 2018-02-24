class TwitterSearchHistory < ApplicationRecord
  validates_presence_of :start_tweet_id, :end_tweet_id, :query
end
