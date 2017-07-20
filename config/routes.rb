Rails.application.routes.draw do

  get 'incoming/create'

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

  resources :topics

  devise_for :users

  post :incoming, to: 'incoming#create'

  resources :users, only: [:show]

  resources :welcome, only: [:index]

  root 'routes#root'

end
