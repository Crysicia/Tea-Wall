# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_session_skills) }
  end
end
