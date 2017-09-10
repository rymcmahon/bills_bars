Rails.application.routes.draw do
  devise_for :users

  resources :barrooms
  
  root to: "barrooms#index"
end
