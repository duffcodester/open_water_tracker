class ApiController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'ostruct'

  OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
  OpenURI::Buffer.const_set 'StringMax', 0

  def analytics
    swim_records = SwimRecord.joins(:swimmer).where(swimmers: {account_id: current_user.account_id}, completed: true).order(check_in: :asc)

    # query years of analytics starting with the first swim_record under the account
    years = swim_records.first.check_in.year..DateTime.now.year

    data = []

    years.each do |year|
      beginning_of_year = DateTime.new(year).beginning_of_year
      end_of_year = DateTime.new(year).end_of_year
      year_swim_records = swim_records.where(check_in: beginning_of_year..end_of_year)
      data << {year: year, total_swims: year_swim_records.count, unique_swimmers: year_swim_records.distinct.count('swimmer_id')}
    end

    render json: data.to_json
  end
end
