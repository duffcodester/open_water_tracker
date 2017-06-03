class RemoveUnneededColumns < ActiveRecord::Migration
  def change
  	remove_column :swimmers, :usms_number
  	remove_column :swimmers, :lmsc
  	remove_column :swimmers, :reviewed_waiver
  	remove_column :swimmers, :reviewed_waiver_date
  end
end
