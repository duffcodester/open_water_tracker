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

  def analytics
  end

  def swimmer_import
    Swimmer.import(params[:file], current_user.account_id)
    redirect_to check_in_path
    flash[:success] = 'Swimmers Imported'
  end

  def records
    @records = (SwimRecord.joins(:swimmer).where(swimmers: {account_id: current_user.account_id}, completed: true).sort_by &:created_at).reverse
    render :layout => false
  end

  def index
    respond_to do |format|
      puts "Josh: calling swimmers controller #index"
      format.html # index page
      format.json {render json: Swimmer.where(account_id: current_user.account_id)}
    end
  end

  def new
    @swimmer = Swimmer.new
  end

  def create
    @swimmer = Swimmer.new(swimmer_params)
    @swimmer.account_id = current_user.account_id
    if @swimmer.save 
      render json: @swimmer.to_json
    else
      render json: @swimmer.errors, status: :unprocessable_entity
    end
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
    # show swimmers import page 
  end

  def destroy
    if @swimmer.destroy
      head :no_content
    else
      render json: @swimmer.errors, status: :unprocessable_entity
    end
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
