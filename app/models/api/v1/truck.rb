class Api::V1::Truck < ApplicationRecord
  belongs_to :driver
  has_many :cargos
end