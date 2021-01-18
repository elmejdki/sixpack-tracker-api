Rails.application.routes.draw do
  resources :measurements
  resources :measures

  get 'users', to: 'users#index'

  post 'signup', to: 'users#create'

  post 'auth/login', to: 'authentication#authenticate'
end
