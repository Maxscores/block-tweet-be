class HourSentimentSerializer < ActiveModel::Serializer
  attributes :normalized_score, :query, :hours_ago, :created_at

  def normalized_score
    object.score.to_f * object.magnitude.to_f
  end

  def hours_ago
    (object.created_at.beginning_of_hour - Time.now.beginning_of_hour) / 3600
  end

end
