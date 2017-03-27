class Minivan < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :capacity, presence: true
  validates :model_year, presence: true
  validates :gearbox, inclusion: { in: ["automatic", "manual"], allow_nil: false }
  validates :picture, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
