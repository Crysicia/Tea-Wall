# frozen_string_literal: true

class CreateStudentSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :student_skills do |t|
      t.references :student, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :n_of_times, default: 1

      t.timestamps
    end
  end
end
