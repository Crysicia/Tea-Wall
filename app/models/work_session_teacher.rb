# frozen_string_literal: true

class WorkSessionTeacher < ApplicationRecord
  belongs_to :work_session
  belongs_to :teacher
end
