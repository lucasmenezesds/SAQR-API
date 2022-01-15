# frozen_string_literal: true

# Cargo Models' Class
class Cargo < ApplicationRecord
  belongs_to :truck
  belongs_to :delivery
end
