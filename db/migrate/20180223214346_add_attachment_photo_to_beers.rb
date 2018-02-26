class AddAttachmentPhotoToBeers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :beers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :beers, :photo
  end
end
