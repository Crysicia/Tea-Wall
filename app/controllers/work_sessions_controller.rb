# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_checkboxes, only: %i[new duplicate]

  def new
    @work_session = WorkSession.new
  end

  def create
    WorkSession.create(ws_parameters)
    redirect_to work_sessions_path
  end

  def index
    @work_sessions = WorkSession.all.order(:date)
  end

  def duplicate
    original = WorkSession.find(params[:work_session_id])
    @work_session = original.duplicate
    render 'new'
  end

  private

  def ws_parameters
    params.require(:work_session).permit(
      :title,
      :date,
      :slot_id,
      teacher_ids: [],
      student_ids: [],
      skill_ids: []
    )
  end

  def set_checkboxes
    @skills = Skill.all
    @slots = Slot.all
    @teachers = Teacher.all
    @students = Student.all
  end
end
