# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: [:index]
end
