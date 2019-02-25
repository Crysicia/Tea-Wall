# frozen_string_literal: true

class CreateWorkSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :work_sessions do |t|
      t.string :title
      t.date :date
      t.references :slot, foreign_key: true

      t.timestamps
    end
  end
end
