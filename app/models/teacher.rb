# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :work_session_teachers, dependent: :destroy
  has_many :work_sessions, through: :work_session_teachers
end
