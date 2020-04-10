class AddDeletedAtToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :deleted_at, :datetime
  end
end
