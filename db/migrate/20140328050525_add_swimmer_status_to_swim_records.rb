class AddSwimmerStatusToSwimRecords < ActiveRecord::Migration
  def change
     add_column :swim_records, :completed, :boolean, default: false
  end
end
