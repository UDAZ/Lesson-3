Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resouce :favorites, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end