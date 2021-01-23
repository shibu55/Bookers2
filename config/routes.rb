Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  get '/home/about', to: 'homes#about', as: 'about'
  resources :books
  resources :users
  post 'books/:id', to: 'books#create'
  post 'users', to: 'books#create'
  post 'users/:id', to: 'books#create'
end
