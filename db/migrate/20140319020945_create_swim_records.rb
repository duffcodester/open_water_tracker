class CreateSwimRecords < ActiveRecord::Migration
  def change
    create_table :swim_records do |t|

      t.timestamps
    end
  end
end
