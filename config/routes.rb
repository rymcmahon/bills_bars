Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :barrooms do
    resource :barroom_users
    resources :messages
  end
  resources :articles
  resources :direct_messages

  root to: "barrooms#index"
end
