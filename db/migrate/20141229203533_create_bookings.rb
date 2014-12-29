class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :band
      t.references :show, index: true

      t.timestamps
    end
  end
end
