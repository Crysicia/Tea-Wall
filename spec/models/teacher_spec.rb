# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:subject).of_type(:string) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_session_teachers) }
    it { is_expected.to have_many(:work_sessions).through(:work_session_teachers) }
  end
end
