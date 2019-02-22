# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_locale
  before_action :find_work_session, only: %i[edit update destroy show]
  before_action :set_checkboxes, only: %i[new edit duplicate]

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

  def show; end

  def edit; end

  def update
    if @work_session.update(ws_parameters)
      flash[:success] = "Modification enregistrée"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @work_session.destroy
    flash[:success] = "Séance supprimée"
    redirect_to work_sessions_path
  end

  def duplicate
    original = WorkSession.find(params[:work_session_id])
    @work_session = original.duplicate
    render 'new'
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def ws_parameters
    params.require(:work_session).permit(
      :title,
      :date,
      :slot_id,
      skill_ids: [],
      teacher_ids: [],
      student_ids: [],
      work_session_students_attributes: %i[present id]
    )
  end

  def find_work_session
    @work_session = WorkSession.find(params[:id])
  end

  def set_checkboxes
    @skills = Skill.all
    @slots = Slot.all
    @teachers = Teacher.all
    @students = Student.all
  end
end
