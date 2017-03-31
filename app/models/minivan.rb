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

  def self.return_departures_with_coordinates
    all.map(&:departure).select{|departure| departure.latitude && departure.longitude }
  end

end

# same as :
# all_minivans = Minivan.all
# all_departures = all_minivans.map do |minivan|
#   minivan.departure
# end
# departures_with_coordinates = all_departures..select{|departure| departure.latitude && departure.longitude }

# TODO replace by proper SQL query
