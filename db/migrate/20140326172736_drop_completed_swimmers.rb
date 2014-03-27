class DropCompletedSwimmers < ActiveRecord::Migration
    def up
      drop_table :completed_swimmers
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
