Rails.application.routes.draw do
  devise_for :users

  resources :barrooms do
    resources :barroom_users
  end

  root to: "barrooms#index"
end
