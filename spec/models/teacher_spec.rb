# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'Database' do
    subject(:new_teacher) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:subject).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_session_teachers).dependent(:destroy) }
    it { is_expected.to have_many(:work_sessions).through(:work_session_teachers) }
  end
end
