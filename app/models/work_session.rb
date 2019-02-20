# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :datetime
#  slot_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkSession < ApplicationRecord
  belongs_to :slot
  has_many :work_session_skills, dependent: :destroy
  has_many :skills, through: :work_session_skills
  has_many :work_session_students, dependent: :destroy
  has_many :students, through: :work_session_students
  has_many :work_session_teachers, dependent: :destroy
  has_many :teachers, through: :work_session_teachers
end
