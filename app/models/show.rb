class Show < ActiveRecord::Base
  default_scope { order('starts_at').reverse_order }

  has_many :bands, through: :bookings
  has_many :bookings
end
