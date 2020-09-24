Rails.application.routes.draw do

root 'home#top'

get 'home/about' => 'home#top'

resources :books, only: [:create, :index, :show, :destroy, :edit, :update ]

devise_for :users

resources :users, only: [:show,:index,:edit,:update] do
	resource :relationships, only: [:create, :destroy]
	get 'follows' => 'relationships#follower', as: 'follows'
	get 'followers' => 'relationships#followed', as: 'followers'
end

resources :users, only: :show

end