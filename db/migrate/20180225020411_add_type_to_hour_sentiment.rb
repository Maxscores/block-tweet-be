class AddTypeToHourSentiment < ActiveRecord::Migration[5.1]
  def change
    add_column :hour_sentiments, :query, :string
  end
end
