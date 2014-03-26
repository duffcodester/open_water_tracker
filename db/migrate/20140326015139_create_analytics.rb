class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
