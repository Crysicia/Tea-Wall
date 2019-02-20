# frozen_string_literal: true

Rails.application.routes.draw do
#  root to: 'work_sessions/index'
  resources :teachers, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: [:index]
  resources :work_sessions, only: [:new, :create]
end
