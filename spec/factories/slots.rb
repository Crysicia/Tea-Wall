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
    start_time { Time.zone.now - rand * 6 }
    end_time { Time.zone.now + rand * 6 }
  end
end
