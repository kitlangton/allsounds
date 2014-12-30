class Show < ActiveRecord::Base
  default_scope { order('starts_at').reverse_order }
  has_attached_file :poster, styles: { medium: "400x400>" }

  validates_attachment_content_type :poster, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :poster, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  has_many :bands, through: :bookings
  has_many :bookings
end
