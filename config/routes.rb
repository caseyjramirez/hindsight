Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :communities, only: [:show]
      resources :topics, only: [:index]
      resources :users
      resources :user_types
      resources :postings
      resources :applications
      resources :relationships

      # custom routes for loggin in and ensuring user is logged in.
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'

      get '/authorized_user', to:'sessions#show'
      get '/hello', to: 'applications#hello_world'
    end
  end
  
end