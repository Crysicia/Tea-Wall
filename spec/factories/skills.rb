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

FactoryBot.define do
  factory :skill do
    name { Faker::Job.title }
  end
end
