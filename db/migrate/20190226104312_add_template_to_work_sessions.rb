# frozen_string_literal: true

class AddTemplateToWorkSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :work_sessions, :template, :boolean, default: false
  end
end
