# frozen_string_literal: true

# ReceiveTime's Model Class
class ReceiveTime < ApplicationRecord
  has_one :delivery

  def self.durations_time_based_on_ids_list(ids_array); end
end
