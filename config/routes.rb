Rails.application.routes.draw do
  devise_for :users

  resources :barrooms do
    resource :barroom_users
    resources :messages
  end
  get '/articles/news' => 'articles#news'
  resources :direct_messages

  root to: "barrooms#index"
end
