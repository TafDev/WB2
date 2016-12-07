Rails.application.routes.draw do

  get 'accounts/show'

  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
	  resource :account, only: [:show, :update]
	  resource :profile, only: [:show, :update, :destroy]
  end
end
