# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles, only: %i[index show new create]
  root 'pages#home'
  get 'about', to: 'pages#about'
end
