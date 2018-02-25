class HourSentiment < ApplicationRecord
  default_scope {order("created_at ASC")}

  def hours_ago
    (created_at.beginning_of_hour - Time.now.beginning_of_hour) / 3600
  end
end
