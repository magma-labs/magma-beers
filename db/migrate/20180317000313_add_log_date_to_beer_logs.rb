class AddLogDateToBeerLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :beer_logs, :log_date, :date
    add_index :beer_logs, :log_date
  end
end
