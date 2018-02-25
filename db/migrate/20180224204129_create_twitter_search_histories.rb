class CreateTwitterSearchHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_search_histories do |t|
      t.string :start_tweet_id
      t.string :end_tweet_id
      t.string :query

      t.timestamps
    end
  end
end
