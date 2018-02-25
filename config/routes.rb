Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/sentiment', to: "api/v1/sentiment#show"
  get '/api/v1/twitter_search', to: "api/v1/twitter#show"

end
