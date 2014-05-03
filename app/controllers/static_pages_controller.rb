class StaticPagesController < ApplicationController
  def analytics
    @start_date = params[:start_date]
    if @start_date
      @start_adj = DateTime.strptime(@start_date, '%Y-%m-%d %H:%M:%S').in_time_zone(Time.zone) + 6.hours
    end
    @end_date = params[:end_date]
    if @end_date
      @end_adj = DateTime.strptime(@end_date, '%Y-%m-%d %H:%M:%S').in_time_zone(Time.zone) + 6.hours
    end
    @records = SwimRecord.where(check_out: @start_adj..@end_adj,
                                completed: true)
  end

  def privacy
    unless signed_in?
      render layout: "devise"
    end
  end

  def tos
    unless signed_in?
      render layout: "devise"
    end
  end
end
