class Booking < ApplicationRecord
  belongs_to :minivan
  belongs_to :user
  has_many :reviews
end
