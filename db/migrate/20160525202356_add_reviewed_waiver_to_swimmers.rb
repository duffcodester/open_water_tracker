class AddReviewedWaiverToSwimmers < ActiveRecord::Migration
  def change
    add_column :swimmers, :reviewed_waiver, :boolean, default: false
  end
end
