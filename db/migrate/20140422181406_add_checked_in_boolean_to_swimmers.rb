class AddCheckedInBooleanToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :swimmer_checked_in, :boolean, default: false
  end
end
