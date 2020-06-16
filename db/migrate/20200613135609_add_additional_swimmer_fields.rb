class AddAdditionalSwimmerFields < ActiveRecord::Migration
  def change
    add_column :swimmers, :email, :string
    add_column :swimmers, :emergency_first, :string
    add_column :swimmers, :emergency_last, :string
    add_column :swimmers, :emergency_phone, :string
    add_column :swimmers, :date_of_birth, :datetime
  end
end
