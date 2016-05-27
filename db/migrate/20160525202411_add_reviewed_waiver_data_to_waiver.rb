class AddReviewedWaiverDataToWaiver < ActiveRecord::Migration
  def change
    add_column :swimmers, :reviewed_waiver_date, :datetime
  end
end
