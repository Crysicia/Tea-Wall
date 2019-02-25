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

require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe 'Database' do
    subject(:new_slot) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:start_time).of_type(:time) }
    it { is_expected.to have_db_column(:end_time).of_type(:time) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_sessions).dependent(:destroy) }
  end
end
