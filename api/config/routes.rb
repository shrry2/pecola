# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :smart_home do
    get 'meter', to: 'meter#index'
  end
end
