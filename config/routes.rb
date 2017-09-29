Rails.application.routes.draw do
  devise_for :users

  resources :barrooms do
    resource :barroom_users
    resources :messages
  end

  resources :direct_messages
  
  root to: "barrooms#index"
end
