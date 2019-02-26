# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :date
#  slot_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  template   :boolean          default(FALSE)
#

class WorkSession < ApplicationRecord
  belongs_to :slot
  has_many :work_session_skills, dependent: :destroy
  has_many :skills, through: :work_session_skills
  has_many :work_session_students, dependent: :destroy
  has_many :students, through: :work_session_students
  has_many :work_session_teachers, dependent: :destroy
  has_many :teachers, through: :work_session_teachers

  validates :title, presence: true
  validates :date, presence: true

  scope :templates, ->{ where(template: true) }

  accepts_nested_attributes_for :work_session_students

  def slot_start
    Slot.find(slot_id).start_time
  end

  def slot_end
    Slot.find(slot_id).end_time
  end

  def duplicate
    dup = self.dup
    dup.skills = skills
    dup.teachers = teachers
    dup
  end

  # imortant test integration to do on this method
  def update_student_skills
    skills_ids = skills.pluck(:id)
    students_ids = WorkSessionStudent.all.where(work_session_id: id, present: true).pluck(:student_id)
    students_ids.each do |student_id|
      skills_ids.each do |skill_id|
        student_skill = StudentSkill.find_by(student_id: student_id, skill_id: skill_id)
        if student_skill
          student_skill.update!(n_of_times: student_skill.n_of_times += 1)
        else
          StudentSkill.create!(student_id: student_id, skill_id: skill_id)
        end
      end
    end
  end
end
