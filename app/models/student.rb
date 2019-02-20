# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :work_session_students, dependent: :destroy
  has_many :work_sessions, through: :work_session_students
end
