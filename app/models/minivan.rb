class Minivan < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  mount_uploader :picture, PhotoUploader

  # validates :capacity, presence: true
  # validates :model_year, presence: true
  # validates :gearbox, inclusion: { in: ["automatic", "manual"], allow_nil: false }
  # validates :picture, presence: true
  # validates :description, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :zipcode, presence: true
  # validates :country, presence: true

  geocoded_by :departure_city
  geocoded_by :arrival_city
  after_validation :geocode, if: :departure_city_changed?
  after_validation :geocode, if: :arrival_city_changed?
end
