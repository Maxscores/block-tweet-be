class Api::V1::HourSentimentController < ApplicationController
  def show
    render json: GroupHourSentiment.new(), serializer: GroupHourSentimentSerializer
  end
end
