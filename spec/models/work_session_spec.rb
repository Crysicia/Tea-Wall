# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :datetime
#  slot_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe WorkSession, type: :model do
  describe 'Database' do
    subject(:new_work_session) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:date).of_type(:date) }
    it { is_expected.to have_db_column(:slot_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:slot) }
    it { is_expected.to have_many(:work_session_skills).dependent(:destroy) }
    it { is_expected.to have_many(:skills).through(:work_session_skills) }
    it { is_expected.to have_many(:work_session_students).dependent(:destroy) }
    it { is_expected.to have_many(:students).through(:work_session_students) }
    it { is_expected.to have_many(:work_session_teachers).dependent(:destroy) }
    it { is_expected.to have_many(:teachers).through(:work_session_teachers) }
  end
end
