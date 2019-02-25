# frozen_string_literal: true

# == Schema Information
#
# Table name: slots
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  start_time :time
#  end_time   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slot < ApplicationRecord
  has_many :work_sessions, dependent: :destroy

  validate :cannot_overlap
  validate :cannot_end_before_start

  scope :between, ->(start_time, end_time) { where('end_time > ? AND start_time < ?', start_time, end_time) }

  private

  def cannot_overlap
    errors[:base] << "Slot times cannot be overlapping" if Slot.between(start_time, end_time).any?
  end

  def cannot_end_before_start
    errors.add(:end_time, "cannot be before start time") if end_time < start_time
  end
end
