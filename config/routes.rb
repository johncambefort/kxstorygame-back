# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'  
  
  scope controller: 'users', path: 'auth' do
    get "/sign_up" => :new
    post "/sign_up" => :create
  end

  resources :games, only: %i[index show create]
end
