App::Application.routes.draw do
  root 'charges#index'
  resources :charges, only: [:index]
end
