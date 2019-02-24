# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  resources :teachers
  resources :work_sessions, path: 'sessions' do
    get 'duplicate'
    patch 'update_student_skills'
    put 'update_student_skills'
  end
end
