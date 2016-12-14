Rails.application.routes.draw do


  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
	  resource :account, only: [:show, :update]
	  resource :profile, only: [:show, :update, :destroy] do
		  resources :images, only: [:create, :show]
	  end
  end

  resources :conversations do
	  resources :messages
  end

	resources :searches

end

