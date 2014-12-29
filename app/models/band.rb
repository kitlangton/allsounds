class Band < ActiveRecord::Base
  has_many :shows, through: :bookings
  has_many :bookings
end
