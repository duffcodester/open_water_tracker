class CleanupUnneededDatabaseFields < ActiveRecord::Migration
  def change
    remove_column :swim_records, :phone_number
  end
end
