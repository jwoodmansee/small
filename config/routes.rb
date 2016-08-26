Rails.application.routes.draw do

	resources :posters

  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
