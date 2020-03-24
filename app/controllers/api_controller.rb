class ApiController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'ostruct'

  OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
  OpenURI::Buffer.const_set 'StringMax', 0

  SWIMMER_HEADERS = %w(first_name, mi, last_name)

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

  def records
    respond_to do |format|
      format.csv { render csv: SwimRecord.joins(:swimmer).where(swimmers: {account_id: current_user.account_id}, completed: true), filename: 'records' }
    end
  end

  def out_of_state
    query = params[:search]
    @swimmers = {}
    if query
      url = "https://www.usms.org/reg/members/jqs/searchmembers.php?RegYear=2016&LastName=#{query}&oper=csv&_search=false&nd=1398554078479&rows=200&page=1&sidx=BinaryLastName+asc%2C+FirstName+asc%2C+RegDate&sord=asc&totalrows=-1"
      key = 'swimmer'
      @swimmers = CSV.open(open(url).path,
      headers: true,
      header_converters: :symbol).to_a.map { |row| Hash[key.to_sym, row.to_hash] }
      render json: @swimmers.flatten.to_json
    else
      swimmers = nil
    end
  end
end
