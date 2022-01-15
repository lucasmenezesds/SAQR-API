# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    picking_time { nil }
    load_time { nil }
    transportation_time { nil }
    receive_time { nil }
    storage_time { nil }
    delivery_date { '2018-04-03 16:39:41' }
  end
end
