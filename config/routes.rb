Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  get '/home/about', to: 'homes#about', as: 'about'
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  post 'books/:id', to: 'books#create'
  post 'users', to: 'books#create'
  post 'users/:id', to: 'books#create'
end
