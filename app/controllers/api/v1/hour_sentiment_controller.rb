class Api::V1::HourSentimentController < ApplicationController
  def create
    HourSentiment.create(score: params[:score], magnitude: params[:magnitude], created_at: params[:created_at], query: params[:query])
  end
end
