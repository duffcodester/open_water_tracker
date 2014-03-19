class AddSwimmerIdAndUserIdToSwimRecords < ActiveRecord::Migration
  def change
    add_column :swim_records, :swimmer_id, :integer
    add_column :swim_records, :check_in, :datetime
    add_column :swim_records, :check_out, :datetime
    add_column :swim_records, :user_id, :integer
  end
end
