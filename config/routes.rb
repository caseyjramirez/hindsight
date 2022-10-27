Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :applications
      resources :mentors
      resources :mentees
      resources :relationships
      resources :topics
      resources :communities

      # custom routes for loggin in and ensuring user is logged in.
      post 'mentor/login', to: 'sessions#mentor_login'
      post 'mentee/login', to: 'sessions#mentee_login'

      get '/authorized_user', to:'users#show'
    end
  end
  
end
