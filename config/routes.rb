# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers, only: %i[index]
  resources :work_sessions, only: %i[index], path: 'sessions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
end
