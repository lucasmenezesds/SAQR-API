# frozen_string_literal: true

# Truck's Model Class
class Truck < ApplicationRecord
  belongs_to :driver
  has_many :cargos
end
