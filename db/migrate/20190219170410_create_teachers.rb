# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :subject

      t.timestamps
    end
  end
end
