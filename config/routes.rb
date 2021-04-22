Rails.application.routes.draw do
  root to: 'charges#index'
  get 'charges', to: 'charges#index'
end
