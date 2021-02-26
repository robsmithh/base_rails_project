# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/sign_up', to: 'user#sign_up', as: :sign_up
  post '/sign_up', to: 'user#authenticate'
end
