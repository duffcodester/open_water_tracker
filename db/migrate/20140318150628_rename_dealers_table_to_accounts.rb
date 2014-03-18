class RenameDealersTableToAccounts < ActiveRecord::Migration
  def change
    rename_table :dealers, :accounts
  end
end
