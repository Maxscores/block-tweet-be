class CreateHourSentiments < ActiveRecord::Migration[5.1]
  def change
    create_table :hour_sentiments do |t|
      t.string :score
      t.string :magnitude

      t.timestamps
    end
  end
end
