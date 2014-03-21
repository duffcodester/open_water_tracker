class RenameUserIdAndAddCheckedOutUserId < ActiveRecord::Migration
  def change
    rename_column :swim_records, :user_id, :check_in_user_id
    add_column :swim_records, :check_out_user_id, :integer
  end
end
