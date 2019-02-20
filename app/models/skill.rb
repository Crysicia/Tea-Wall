# frozen_string_literal: true

class Skill < ApplicationRecord
  has_many :work_session_skills, dependent: :destroy
end
