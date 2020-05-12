Rails.application.routes.draw do
	devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :users,only: [:show,:edit,:update,:index] do
    member do
      get 'followers'
      get 'followings'
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]

  root 'home#top'
  get 'home/about'
	get 'search', to: 'search#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
