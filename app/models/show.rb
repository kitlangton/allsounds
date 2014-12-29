class Show < ActiveRecord::Base
  has_many :bands, through: :bookings
  has_many :bookings
end
