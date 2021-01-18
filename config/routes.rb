Rails.application.routes.draw do
  resources :measurements
  resources :measures

  get 'users', to: 'users#index'

  post 'users', to: 'users#create'
end
