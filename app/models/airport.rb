class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  has_many :departure_flight, class_name: 'Flight', foreign_key: 'departure_airport_id'
  has_many :arrival_flight, class_name: 'Flight', foreign_key: 'arrival_airport_id'
end
