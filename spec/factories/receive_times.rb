# frozen_string_literal: true

FactoryBot.define do
  factory :receive_time do
    duration_time { 1 }
    event { false }
    received_date { '2018-04-03 16:39:40' }
  end
end
