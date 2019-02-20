# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_teachers
#
#  id              :bigint(8)        not null, primary key
#  work_session_id :bigint(8)
#  teacher_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WorkSessionTeacher < ApplicationRecord
  belongs_to :work_session
  belongs_to :teacher
end
