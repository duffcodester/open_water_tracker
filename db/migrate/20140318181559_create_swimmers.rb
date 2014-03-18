class CreateSwimmers < ActiveRecord::Migration
  def change
    create_table :swimmers do |t|
      t.string :first_name
      t.string :last_name
      t.string :usms_number
      t.string :lmsc

      t.timestamps
    end
  end
end
