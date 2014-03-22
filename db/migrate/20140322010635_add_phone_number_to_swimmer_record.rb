class AddPhoneNumberToSwimmerRecord < ActiveRecord::Migration
  def change
    add_column :swim_records, :phone_number, :string
  end
end
