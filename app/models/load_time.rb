# frozen_string_literal: true

# LoadTime's Model Class
class LoadTime < ApplicationRecord
  has_one :delivery

  def self.durations_time_based_on_ids_list(ids_array); end
end
