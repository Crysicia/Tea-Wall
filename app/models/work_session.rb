# frozen_string_literal: true

class WorkSession < ApplicationRecord
  belongs_to :slot
  has_many :work_session_skills, dependent: :destroy
  has_many :skills, through: :work_session_skills
  has_many :work_session_students, dependent: :destroy
  has_many :students, through: :work_session_students
  has_many :work_session_teachers, dependent: :destroy
  has_many :teachers, through: :work_session_teachers
end
