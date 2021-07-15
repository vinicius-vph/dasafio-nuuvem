Rails.application.routes.draw do
  root 'home#index'

  post 'transaction/', to: 'transaction#create'
  get 'transaction/results', to: 'transaction#results'
end
