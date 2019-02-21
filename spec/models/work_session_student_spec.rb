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
#  present         :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe WorkSessionStudent, type: :model do
  describe 'Database' do
    subject(:new_work_session_student) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:work_session_id).of_type(:integer) }
    it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:work_session) }
    it { is_expected.to belong_to(:student) }
  end
end
