class ApiController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'ostruct'

  # Don't allow downloaded files to be created as StringIO. Force a tempfile to be created.
  OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
  OpenURI::Buffer.const_set 'StringMax', 0

  SWIMMER_HEADERS = %w(first_name, mi, last_name, lmsc, usms_number)

  def analytics
    records_2014 = SwimRecord.where(completed: true, check_out: '2014-01-01'..'2014-12-31')
    records_2015 = SwimRecord.where(completed: true, check_out: '2015-01-01'..'2015-12-31')

    data = {
      total_swims_2014: records_2014.count,
      unique_swimmers_2014: records_2014.distinct.count('swimmer_id'),
      total_swims_2015: records_2015.count,
      unique_swimmers_2015: records_2015.distinct.count('swimmer_id')
    }

    render json: data.to_json
  end

  def records
    respond_to.csv { render csv: SwimRecord.where(completed: true), filename: 'records' }
  end

  def out_of_state
    query = params[:search]
    @swimmers = {}
    if query
      url = "http://www.usms.org/reg/members/jqs/searchmembers.php?RegYear=2014&LastName=#{query}&oper=csv&_search=false&nd=1398554078479&rows=200&page=1&sidx=BinaryLastName+asc%2C+FirstName+asc%2C+RegDate&sord=asc&totalrows=-1"
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
