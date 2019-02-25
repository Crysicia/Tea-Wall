# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'work_sessions#index'
  devise_for :users
  resources :students do
    delete 'destroy_skill'
  end
  resources :teachers
  resources :work_sessions, path: 'sessions' do
    get 'duplicate'
    patch 'update_student_skills'
    put 'update_student_skills'
  end
end
