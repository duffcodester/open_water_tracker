class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :users, :account_id, :integer
    add_column :swimmers, :account_id, :integer
  end
end
