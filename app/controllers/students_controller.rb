# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update destroy show]

  def index
    @students = Student.all
  end

  def show
    @student_skills = StudentSkill.where(student_id: @student.id)
  end

  def edit; end

  def update
    if @student.update(student_params)
      flash[:success] = "Modification enregistrée"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "Élève supprimé"
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
