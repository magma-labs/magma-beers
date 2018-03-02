class CreateBeerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_logs do |t|
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
