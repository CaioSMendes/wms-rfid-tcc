Rails.application.routes.draw do
  devise_for :users
  get "data/fill", to: "clients#fill"
  get 'addresses', to: 'address#show'
  root 'home#index'
  get 'busca/index'
  get '/search' => 'bluetoohsearches#search'
  resources :bluetoohsearches
  resources :wallets
  resources :taxes
  resources :buys
  resources :sells
  resources :clients
  resources :addresses
  resources :providers
  resources :categories
  resources :products
  resources :prodrfid
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
