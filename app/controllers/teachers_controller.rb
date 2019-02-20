# frozen_string_literal: true

class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.order(:subject)
  end
end
