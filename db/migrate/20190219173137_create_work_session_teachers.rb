# frozen_string_literal: true

class CreateWorkSessionTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :work_session_teachers do |t|
      t.references :work_session, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
