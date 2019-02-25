# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update destroy show destroy_skill]

  before_action :update_or_delete, only: %i[update destroy_skill]

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
      redirect_to edit_student_path(@student.id)
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "Élève supprimé"
    redirect_to students_path
  end

  def destroy_skill
    StudentSkill.find_by(student_id: @student.id, skill_id: params[:skill_id]).destroy
    flash[:success] = "Compétence supprimée"
    redirect_to edit_student_path(@student.id)
  end

  private

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      skill_ids: [],
      student_skills_attributes: %i[n_of_times id]
    )
  end

  def find_student
    @student = Student.find(params[:id])
  end

  def update_or_delete
    if params[:commit] == 'Modifier' || params[:commit] == 'Enregistrer les modifications'
      update
    else
      destroy_skill
    end
  end
end
