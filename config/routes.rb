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
  get 'follows/:id' => 'relationships#follows', as: 'follows' # フォローする
  get 'followers/:id' => 'relationships#followers', as: 'followers' # フォロー外す
  post 'books/:id', to: 'books#create'
  post 'users', to: 'books#create'
  post 'users/:id', to: 'books#create'
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
  get '/search', to: 'search#search'
end
