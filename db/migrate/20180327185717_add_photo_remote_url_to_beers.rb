class AddPhotoRemoteUrlToBeers < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :photo_remote_url, :string
  end
end
