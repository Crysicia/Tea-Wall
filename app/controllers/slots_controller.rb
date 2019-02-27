# frozen_string_literal: true

class SlotsController < ApplicationController
  before_action :find_slot, only: %i[edit update]

  def index
    @slots = Slot.all.order(:start_time)
  end

  def edit; end

  def update
    if @slot.update!(slot_params)
      flash[:success] = "Modification enregistrée"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  private

  def slot_params
    params.require(:slot).permit(
      :title,
      :start_time,
      :end_time
    )
  end

  def find_slot
    @slot = Slot.find(params[:id])
  end
end
