# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skill < ApplicationRecord
  has_many :work_session_skills, dependent: :destroy
  has_many :student_skills, dependent: :destroy
end
