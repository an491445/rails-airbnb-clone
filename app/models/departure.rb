class Departure < ApplicationRecord
  belongs_to :minivan

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
