Rails.application.routes.draw do

  resources :bookmarks

  resources :topics

  devise_for :users

  resources :users, only: [:show]

  resources :welcome, only: [:index]

  root 'routes#root'

end
