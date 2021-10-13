Rails.application.routes.draw do

  root "transactions#index"
  resources :suppliers
  resources :customers
  resources :items
  resources :transactions
end
