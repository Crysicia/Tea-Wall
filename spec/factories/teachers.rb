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

FactoryBot.define do
  factory :teacher do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    subject { Faker::Job.field }
  end
end
