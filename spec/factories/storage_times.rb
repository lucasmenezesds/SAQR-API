# frozen_string_literal: true

FactoryBot.define do
  factory :storage_time do
    duration_time { 1 }
    event { false }
    storage_date { '2018-04-03 16:39:37' }
  end
end
