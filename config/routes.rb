Rails.application.routes.draw do

  get 'goals/index'

	get '/users/sign_in' => redirect("/users/sign_up")
  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
	  resource :account, only: [:show, :update]
	  resource :profile, only: [:show, :update, :destroy] do
		  resources :goals
		  resources :images, only: [:index, :create, :show, :destroy]
	  end
  end

	resources :likes
	resources :conversations do
	  resources :messages
  end

	resources :searches

  mount ActionCable.server, at: '/cable'

end

