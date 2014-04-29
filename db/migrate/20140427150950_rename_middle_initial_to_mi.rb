class RenameMiddleInitialToMi < ActiveRecord::Migration
  def change
    rename_column :swimmers, :middle_initial, :mi
  end
end
