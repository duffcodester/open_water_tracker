class StaticPagesController < ApplicationController

  def analytics
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @records = SwimRecord.where(created_at: @start_date..@end_date, completed:true)
  end
end
