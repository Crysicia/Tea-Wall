# frozen_string_literal: true

class CreateWorkSessionStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :work_session_students do |t|
      t.references :work_session, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
