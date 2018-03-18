class Api::V1::Delivery < ApplicationRecord
  belongs_to :picking_time
  belongs_to :load_time
  belongs_to :transportation_time
  belongs_to :receive_time
  belongs_to :storage_time
  has_many :cargos
end