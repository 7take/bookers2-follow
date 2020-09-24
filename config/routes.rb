Rails.application.routes.draw do

root 'home#top'

get 'home/about' => 'home#top'

resources :books, only: [:create, :index, :show, :destroy, :edit, :update ]

devise_for :users

resources :users, only: [:show,:index,:edit,:update]

post 'follow/:id' => 'relationships#follow', as: 'follow' #フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' #フォロー外す
resources :users, only: :show
resources :followings
resources :followers

end