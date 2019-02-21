# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_locale

  def index
    @work_sessions = WorkSession.all.order(:date)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
