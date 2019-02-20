# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_students
#
#  id              :bigint(8)        not null, primary key
#  work_session_id :bigint(8)
#  student_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe WorkSessionStudent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
