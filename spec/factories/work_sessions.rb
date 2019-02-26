# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :date
#  slot_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  template   :boolean          default(FALSE)
#

FactoryBot.define do
  factory :work_session do
    title { Faker::Science.element }
    date { Faker::Date.between(10.days.ago, 10.days.from_now) }
    slot

    trait :past_date do
      date { Faker::Date.between(100.days.ago, 1.day.ago) }
    end

    trait :future_date do
      date { Faker::Date.between(1.day.from_now, 100.days.from_now) }
    end

    factory :past_work_session,   traits: [:past_date]
    factory :future_work_session, traits: [:future_date]
  end
end
