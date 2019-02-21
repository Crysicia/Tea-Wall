class AddFieldPresentToWorkSessionStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :work_session_students, :present, :boolean
  end
end
