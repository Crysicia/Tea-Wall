# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: %i[index edit destroy update]
  resources :work_sessions, only: %i[new create index], path: 'sessions'
end
