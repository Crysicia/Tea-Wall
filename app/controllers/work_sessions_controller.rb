# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  def new
    @work_session = WorkSession.new
    @skills = Skill.all
    @slots = Slot.all
    @teachers = Teacher.all
    @students = Student.all
  end

  def create
    puts params
    redirect_to work_sessions_path
  end

  def index
    @work_sessions = WorkSession.all.order(:date)
  end
end
