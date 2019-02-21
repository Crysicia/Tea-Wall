# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :find_work_session, only: %i[edit update]

  def new
    @work_session = WorkSession.new
    @skills = Skill.all
    @slots = Slot.all
    @teachers = Teacher.all
    @students = Student.all
  end

  def create
    WorkSession.create(ws_parameters)
    redirect_to work_sessions_path
  end

  def index
    @work_sessions = WorkSession.all.order(:date)
  end

  def edit
    @skills = Skill.all
    @slots = Slot.all
    @teachers = Teacher.all
    @students = Student.all
  end

  def update
    if @work_session.update(ws_parameters)
      flash[:success] = "Modification enregistrée"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  private

  def ws_parameters
    params.require(:work_session).permit(
      :title,
      :date,
      :slot_id,
      skill_ids: [],
      teacher_ids: [],
      student_ids: []
    )
  end

  def find_work_session
    @work_session = WorkSession.find(params[:id])
  end
end
