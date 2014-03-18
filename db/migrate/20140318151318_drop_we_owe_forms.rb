class DropWeOweForms < ActiveRecord::Migration
  def change
    drop_table :weowe_forms
  end
end
