class StaticPagesController < ApplicationController
  def analytics
    @records_2015 = SwimRecord.where(completed: true, check_out: "2014-01-01".."2014-12-31")
    @records_2014 = SwimRecord.where(completed: true, check_out: "2015-01-01".."2015-12-31")
    @unique_2015 = @records_2015.distinct.count('swimmer_id')
  end

  def privacy
  end

  def tos
  end

  def faq
  end

  def admin
    @users = User.all
  end
end
