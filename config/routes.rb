Rails.application.routes.draw do
  get 'events', to: 'events#index'

  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'

  post 'posts', to: 'posts#create'
  
  get 'admin', to: 'users#index'

  get 'messages', to: 'messages#index'

  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'home#index'

  root 'home#index'
end
