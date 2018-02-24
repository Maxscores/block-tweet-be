class Api::V1::SentimentController < ApplicationController
  def show
    render json: HourSentiment.all
  end
end
