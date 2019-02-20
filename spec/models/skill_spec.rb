# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:work_session_skills).dependent(:destroy) }
  end
end
