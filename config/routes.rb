Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :applications
      resources :mentors, only: [:create, :index, :show]
      resources :mentees, only: [:create]
      resources :relationships, only: [:show, :create]
      resources :topics, only: [:index]
      resources :communities, only: [:show]

      # custom routes for loggin in and ensuring user is logged in.
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'

      get '/authorized_user', to:'sessions#show'
      get '/hello', to: 'applications#hello_world'
    end
  end
  
end