class AddIndexToSwimmers < ActiveRecord::Migration
  def change
    add_index :swimmers, :usms_number
  end
end
