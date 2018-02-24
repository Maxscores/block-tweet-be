class Api::V1::SentimentController < ApplicationController
  def show
    render json: GoogleNaturalLanguageService.analyze(params[:text])

  end
end
