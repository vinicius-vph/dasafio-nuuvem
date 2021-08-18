Rails.application.routes.draw do
  root 'home#index'

  resources :transaction, only: %i[index new create]
end
