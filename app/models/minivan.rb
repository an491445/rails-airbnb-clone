class Minivan < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one :departure, dependent: :destroy
  has_one :arrival, dependent: :destroy

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


end
