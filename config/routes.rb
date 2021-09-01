Rails.application.routes.draw do
  root 'home#index'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
