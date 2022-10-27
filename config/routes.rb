Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :applications
      resources :mentors, only: [:create]
      resources :mentees, only: [:create]
      resources :relationships
      resources :topics
      resources :communities

      # custom routes for loggin in and ensuring user is logged in.
      post '/login', to: 'sessions#login'

      get '/authorized_user', to:'sessions#show'
    end
  end
  
end
