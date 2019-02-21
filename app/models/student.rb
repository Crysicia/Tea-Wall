# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  has_many :work_session_students, dependent: :destroy
  has_many :work_sessions, through: :work_session_students

  def first_and_last_name
    "#{first_name} #{last_name.upcase}"
  end
end
