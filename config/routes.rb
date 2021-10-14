Rails.application.routes.draw do

  get 'tests/top'
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :items, only: [:show, :index]
  resource :customers, only: [:show, :edit, :update]
  get '/customers/check' => 'customers#check'
  put '/customers/resign' => 'customers#resign'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete '/cart_items' => 'cart_items#destroy_all'
  get '/orders/complete' => 'orders#complete'
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/comfirm' => 'orders#comfirm'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admin do
    root to: 'homes#top'
    get '/home/about' => 'homes#about'
    resources :items, only: [:new, :create, :show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end
end
