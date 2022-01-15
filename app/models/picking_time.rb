# frozen_string_literal: true

# PickingTime's Model Class
class PickingTime < ApplicationRecord
  has_one :delivery

  def self.duration_times_based_on_deliveries; end
end
