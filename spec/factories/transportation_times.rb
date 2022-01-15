# frozen_string_literal: true

FactoryBot.define do
  factory :transportation_time do
    duration_time { 1 }
    event { false }
    transportation_date { '2018-04-03 16:39:33' }
    origin_city { nil }
    destination_city { nil }
  end
end
