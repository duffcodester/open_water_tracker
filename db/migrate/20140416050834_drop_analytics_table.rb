class DropAnalyticsTable < ActiveRecord::Migration
  def change
    drop_table :analytics
  end
end
