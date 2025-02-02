# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :orders, only: %i[new create] do 
    collection do
      post :confirm
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'
end
