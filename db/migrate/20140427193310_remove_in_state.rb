class RemoveInState < ActiveRecord::Migration
  def change
    remove_column :swimmers, :in_state
  end
end
