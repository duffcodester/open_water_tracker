class StaticPagesController < ApplicationController
  def analytics
    @start_date = params[:start_date]
    if @start_date
      @start_adj = DateTime.strptime(@start_date, '%Y-%m-%d %H:%M:%S').in_time_zone(Time.zone)
    end
    puts "Start: #{@start_date}"
    puts "Start: #{@start_adj}"
    @end_date = params[:end_date]
    if @end_date
      @end_adj = DateTime.strptime(@end_date, '%Y-%m-%d %H:%M:%S').in_time_zone(Time.zone)
    end
    puts "End: #{@end_date}"
    puts "End: #{@end_adj}"
    puts DateTime.now.zone
    @records = SwimRecord.where(check_out: @start_adj..@end_adj,
                                completed: true)
  end
end
