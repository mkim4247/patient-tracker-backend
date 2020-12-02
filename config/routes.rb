Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :users, :providers, :user_providers
    end 
  end 
end
