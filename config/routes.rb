Rails.application.routes.draw do
  get 'homes/top'
  get '/homes/about', to: 'homes#about'
  devise_for :users
  root to: "homes#top"
  resources :books
  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
