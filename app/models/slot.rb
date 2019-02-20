# frozen_string_literal: true

# == Schema Information
#
# Table name: slots
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slot < ApplicationRecord
  has_many :work_sessions, dependent: :destroy
end
