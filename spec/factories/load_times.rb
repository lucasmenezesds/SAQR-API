# frozen_string_literal: true

FactoryBot.define do
  factory :load_time do
    duration_time { 1 }
    event { false }
    load_date { '2018-04-03 16:39:39' }
  end
end
