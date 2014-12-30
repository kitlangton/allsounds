class AddAttachmentPosterToShows < ActiveRecord::Migration
  def self.up
    change_table :shows do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :shows, :poster
  end
end
