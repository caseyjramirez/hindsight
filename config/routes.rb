Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :applications
      resources :relationships
      resources :mentees
      resources :mentors
      resources :topics
      resources :communities
    end
  end
  
end
