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

FactoryBot.define do
  factory :slot do
    title { Faker::DcComics.hero }
    start_time { Faker::Time.between(Time.zone.now - 5.hours, Time.zone.now) }
    end_time { Faker::Time.between(Time.zone.now + 1.hour, Time.zone.now + 4.hours) }
  end
end
