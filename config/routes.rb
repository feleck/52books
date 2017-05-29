Rails.application.routes.draw do
  resources :authors
  resources :bookstores
  resources :books, except: [:index]
  get 'library', to: 'books#index'
  get 'books', to: 'books#read'
end
