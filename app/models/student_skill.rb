# == Schema Information
#
# Table name: student_skills
#
#  id         :bigint(8)        not null, primary key
#  student_id :bigint(8)
#  skill_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentSkill < ApplicationRecord
  belongs_to :student
  belongs_to :skill
end
