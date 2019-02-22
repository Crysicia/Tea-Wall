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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :subject, presence: true

  def first_and_last_name
    "#{first_name} #{last_name.upcase}"
  end
end
