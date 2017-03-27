class Booking < ApplicationRecord
  belongs_to :minivan
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :price, presence: true
end
