Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  delete 'books/:id', to: 'books#destroy'
  root to: "homes#top"
  get 'homes/users', to: 'homes#users'
  get "home/about" => "homes#about", as: "about"
end
