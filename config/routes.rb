# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'stories#index'

  resources :stories, only: %i[index show create update]
  resources :games, only: %i[index show create update]
end
