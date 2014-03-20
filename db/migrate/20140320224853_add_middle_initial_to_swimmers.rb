class AddMiddleInitialToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :middle_initial, :string
  end
end
