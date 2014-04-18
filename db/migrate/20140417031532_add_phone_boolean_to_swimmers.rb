class AddPhoneBooleanToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :phone_added, :boolean, default: false
  end
end
