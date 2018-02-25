class Api::V1::HourSentimentController < ApplicationController
  def show
    render json: GroupHourSentiment.new(), each_serializer: GroupHourSentimentSerializer
  end
end
