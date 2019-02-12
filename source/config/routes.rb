Rails.application.routes.draw do

  resources :charges, only: [:index]

end
