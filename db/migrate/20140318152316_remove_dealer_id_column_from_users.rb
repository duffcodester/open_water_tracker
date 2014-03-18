class RemoveDealerIdColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :dealer_id
  end
end
