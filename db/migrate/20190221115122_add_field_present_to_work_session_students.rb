# frozen_string_literal: true

class AddFieldPresentToWorkSessionStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :work_session_students, :present, :boolean, default: false
  end
end
