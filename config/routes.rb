# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  scope controller: 'users', path: 'users' do
    get '/sign_up' => :new
    post '/sign_up' => :create
  end

  resources :confirmations, only: %i[create edit new], param: :confirmation_token

  scope controller: 'sessions' do
    post '/login' => :create
    get '/login' => :new
    delete '/logout' => :destroy
  end

  scope controller: 'users' do
    get '/account' => :edit
    put '/account' => :update
    delete '/account' => :destroy
  end

  resources :passwords, only: %i[create edit new update], param: :password_reset_token

  resources :games, only: %i[index show create]
end
