# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ApplicationRecord
  has_many :work_session_teachers, dependent: :destroy
  has_many :work_sessions, through: :work_session_teachers
end
