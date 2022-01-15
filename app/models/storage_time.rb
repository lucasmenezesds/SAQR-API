# frozen_string_literal: true

# StorageTime's Model Class
class StorageTime < ApplicationRecord
  has_one :delivery

  def self.durations_time_based_on_ids_list(ids_array); end
end
