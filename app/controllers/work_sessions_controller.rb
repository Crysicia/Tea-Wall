# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  def index
    @work_sessions = WorkSession.all.order(:date)
  end
end
