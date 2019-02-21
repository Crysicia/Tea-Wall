# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :find_teacher, only: %i[edit update destroy]

  def index
    @teachers = Teacher.all.order(:subject)
  end

  def edit; end

  def update
    if @teacher.update(teacher_params)
      flash[:success] = "Modification enregistrée"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @teacher.destroy
    flash[:success] = "Professeur supprimé"
    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :subject)
  end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
