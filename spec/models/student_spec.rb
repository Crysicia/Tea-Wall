# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_session_students).dependent(:destroy) }
    it { is_expected.to have_many(:work_sessions).through(:work_session_students) }
  end
end
