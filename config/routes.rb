Rails.application.routes.draw do

  get 'incoming/create'

  resources :bookmarks

  resources :topics

  devise_for :users

  post :incoming, to: 'incoming#create'

  resources :users, only: [:show]

  resources :welcome, only: [:index]

  root 'routes#root'

end
