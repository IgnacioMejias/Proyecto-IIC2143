# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  # get 'home/index'
  get 'home/about'
  get 'search', to: 'products#search'
  root 'home#index'

  resources :order_items

  resource :carts, only: %i[show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :reviews, only: %i[new create edit update destroy] # falta el destroy
  end

  # REQUEST --------------------------------------
  resources :products do
    resources :requests, only: %i[new create edit update destroy] # falta el destroy
  end
  # #### CREATE
  # get '/requests/new', to: 'requests#new', as: 'requests'
  # post '/requests/new', to: 'requests#create', as: 'requests_create'

  # #### READ
  get '/requests', to: 'requests#index', as: 'requests_index'
  get '/requests/:id', to: 'requests#show', as: 'requests_show'
  delete '/requests/:id', to: 'requests#destroy', as: 'requests_destroy'

  get '/reviews', to: 'reviews#index', as: 'reviews_index'
  delete '/reviews/:id', to: 'reviews#destroy', as: 'reviews_destroy'

  delete '/order_items/:id', to: 'order_items#destroy', as: 'order_items_destroy'

  # #### UPDATE
  # get '/requests/:id/edit', to: 'requests#edit', as: 'requests_edit'
  # patch '/requests/:id', to: 'requests#update', as: 'requests_update'

  # #### DELETE
  # delete '/requests/:id', to: 'requests#delete', as: 'requests_delete'

  # Conversations --------------------------------------
  resources :conversations do
    resources :messages
  end
end
