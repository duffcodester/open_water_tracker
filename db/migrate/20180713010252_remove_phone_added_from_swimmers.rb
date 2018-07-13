class RemovePhoneAddedFromSwimmers < ActiveRecord::Migration
  def change
  	remove_column :swimmers, :phone_added
  end
end
