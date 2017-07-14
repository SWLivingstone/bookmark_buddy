Rails.application.routes.draw do

  resources :topics

  devise_for :users

  resources :users, only: [:show]

  resources :welcome, only: [:index]

  root 'routes#root'

end
