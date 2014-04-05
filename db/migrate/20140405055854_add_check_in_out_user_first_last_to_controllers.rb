class AddCheckInOutUserFirstLastToControllers < ActiveRecord::Migration
  def change
    add_column :swim_records, :check_in_first_name, :string
    add_column :swim_records, :check_in_last_name, :string
    add_column :swim_records, :check_out_first_name, :string
    add_column :swim_records, :check_out_last_name, :string
  end
end
