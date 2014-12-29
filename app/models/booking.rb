class Booking < ActiveRecord::Base
  belongs_to :show
  belongs_to :band
end
