Rails.application.routes.draw do
  root 'credit_card_charges#index'

  resources :credit_card_charges, path: '/charges'
  resources :customers
end
