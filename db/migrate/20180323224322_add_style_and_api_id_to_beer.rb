class AddStyleAndApiIdToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :style, :string
    add_column :beers, :api_id, :integer
  end
end
