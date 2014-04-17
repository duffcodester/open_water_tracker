class AddInStateToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :in_state, :boolean, default: false
  end
end
