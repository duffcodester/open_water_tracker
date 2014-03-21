class AddPhoneNumberToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :phone_number, :string
  end
end
