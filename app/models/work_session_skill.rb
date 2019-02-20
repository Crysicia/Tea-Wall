# frozen_string_literal: true

class WorkSessionSkill < ApplicationRecord
  belongs_to :work_session
  belongs_to :skill
end
