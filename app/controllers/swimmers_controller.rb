class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]

  require 'csv'
  require 'open-uri'
  require 'ostruct'

  OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
  OpenURI::Buffer.const_set 'StringMax', 0

  SWIMMER_HEADERS = %w(first_name, mi, last_name, lmsc, usms_number)

  def check_in
  end

  def check_out
  end

  def out_of_state
  end

  def analytics
  end

  def records
    @records = (SwimRecord.where(completed: true).sort_by &:created_at).reverse
    render :layout => false
  end

  def index
    render json: oj_dumper(Swimmer.all)
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
      index_respond_to_format_methods(@swimmers)
    else
      @swimmers = nil
    end
  end

  def new
    @swimmer = Swimmer.new
  end

  def create
    @swimmer = Swimmer.new(swimmer_params)
    @swimmer.save ? (redirect_to swimmers_url) : create_and_update_json_else
  end

  def update
    if @swimmer.update(swimmer_params)
      if @swimmer.phone_number == ''
        @swimmer.phone_added = false
      elsif @swimmer.phone_number
        @swimmer.phone_added = true
      end
      @swimmer.save!
      render :show
    else
      create_and_update_json_else
    end
  end

  def import
    call_rake :import
    flash[:success] = 'Please allow one minute to update'
    redirect_to '/check_in'
  end

  private

  include ApplicationHelper
  include SwimmersHelper

  def set_swimmer
    @swimmer = Swimmer.find(params[:id])
  end

  def create_and_update_json_else
    render json: @swimmer.errors, status: :unprocessable_entity
  end

  def index_respond_to_format_methods(view)
    respond_to do |format|
      format.html
      format.json do
        render json: oj_dumper(view)
      end
    end
  end

  def oj_dumper(view)
    Oj.dump(view.select([:id, :last_name, :first_name, :mi, :phone_number,
                         :usms_number, :lmsc, :phone_added, :swimmer_checked_in,
                         :reviewed_waiver, :reviewed_waiver_date]), mode: :compat)
  end
end
