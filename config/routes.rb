# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :games, only: %i[show new edit update]

  scope controller: 'games' do
    post '/play' => :create
  end

  resources :poems, only: %i[index create show edit new update]

  resources :confirmations, only: %i[create edit new], param: :confirmation_token

  scope controller: 'sessions' do
    post '/login' => :create
    get '/login' => :new
    delete '/logout' => :destroy
  end

  scope controller: 'users' do
    get '/sign_up' => :new
    post '/sign_up' => :create
    get '/account' => :edit
    put '/account' => :update
    delete '/account' => :destroy
  end

  resources :passwords, only: %i[create edit new update], param: :password_reset_token

  resources :active_sessions, only: [:destroy] do
    collection do
      delete 'destroy_all'
    end
  end
end
