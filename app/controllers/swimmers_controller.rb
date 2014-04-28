class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]

  require 'csv'
  require 'open-uri'
  require 'ostruct'

  # Don't allow downloaded files to be created as StringIO. Force a tempfile to be created.
  OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
  OpenURI::Buffer.const_set 'StringMax', 0

  SWIMMER_HEADERS = %w(first_name, mi, last_name, lmsc, usms_number)

  def index
    @check_in = false
    @swimmers = Swimmer.all
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
    else
      @swimmers = nil
    end
  end

  def show
  end

  def new
    @swimmer = Swimmer.new
  end

  def edit
  end

  def create
    @swimmer = Swimmer.new(swimmer_params)
    @swimmer.save ? (redirect_to swimmers_url) : create_and_update_json_else
  end

  def update
    if @swimmer.update(swimmer_params)
      render :show
    else
      create_and_update_json_else
    end
  end

  def destroy
    @swimmer.destroy
    respond_to do |format|
      format.html { redirect_to swimmers_url }
      format.json { head :no_content }
    end
  end

  def import
    call_rake :import
    flash[:success] = 'Please allow one minute to update.'
    redirect_to swimmers_path
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
end
