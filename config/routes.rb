Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'hour_sentiment/create'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/sentiment', to: "api/v1/sentiment#show"
  get '/api/v1/twitter_search', to: "api/v1/twitter#show"
  post '/api/v1/hour_sentiment', to: 'api/v1/hour_sentiment#create'
end
