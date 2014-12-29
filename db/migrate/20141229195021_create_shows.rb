class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.datetime :starts_at

      t.timestamps
    end

    add_index :shows, :starts_at
  end
end
