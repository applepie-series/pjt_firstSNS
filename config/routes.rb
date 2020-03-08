Rails.application.routes.draw do
  root 'static_pages#runding'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions',
                                      confirmations: 'users/confirmations',
                                      omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get '/microposts/:id/modal', to: 'microposts#modal'
  get    '/home',    to: 'static_pages#home'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/terms',   to: 'static_pages#terms'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers, :likes, :reset
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:new, :create, :destroy, :show] do
    resources :comments,          only: [:create, :destroy]
  end
  resources :relationships,       only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
  resources :notifications,       only: :index
  resources :rooms,               only: [:show, :create]
  resources :messages,            only: :create
end