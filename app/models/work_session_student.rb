# frozen_string_literal: true

class WorkSessionStudent < ApplicationRecord
  belongs_to :work_session
  belongs_to :student
end
