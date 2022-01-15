# frozen_string_literal: true

FactoryBot.define do
  factory :picking_time do
    duration_time { 1 }
    start_time { '2018-04-03 16:39:36' }
    number_of_items { 1 }
    number_of_items_type { 1 }
    picking_date { '2018-04-03 16:39:36' }
  end
end
