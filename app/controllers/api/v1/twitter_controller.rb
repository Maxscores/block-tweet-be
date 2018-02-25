class Api::V1::TwitterController < ApplicationController
  def show
    render json: TwitterService.search(params[:q])
  end
end
