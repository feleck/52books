Rails.application.routes.draw do
  root 'books#read'
  resources :authors
  resources :bookstores
  resources :books, except: [:index] do
    member do
      get 'start_reading'
      get 'finish_reading'
    end
  end
  get 'library', to: 'books#index'
  get 'books', to: 'books#read'
  patch 'library/start_reading/:id', to: 'books#started_reading'
  patch 'library/finish_reading/:id', to: 'books#finished_reading'
end
