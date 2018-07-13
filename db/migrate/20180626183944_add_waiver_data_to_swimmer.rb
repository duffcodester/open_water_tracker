class AddWaiverDataToSwimmer < ActiveRecord::Migration
  def change
  	add_column :swimmers, :waiver_received, :boolean, default: false
  end
end
