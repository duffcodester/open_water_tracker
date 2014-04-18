class StaticPagesController < ApplicationController
  def analytics
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @records = SwimRecord.where(check_out: "#{@start_date} 00:00:01 UTC".."#{@end_date} 23:59:59 UTC", completed: true)
  end
end
