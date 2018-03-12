class AddColumnsToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :abv, :float
    add_column :beers, :ibu, :integer
    add_column :beers, :status, :boolean
    add_column :beers, :year, :integer
  end
end
