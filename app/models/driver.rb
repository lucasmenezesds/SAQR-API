# frozen_string_literal: true

# Driver's Model Class
class Driver < ApplicationRecord
  has_one :truck
end
