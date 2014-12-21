class SwimRecordsController < ApplicationController
  before_action :set_swim_record, only: [:show, :edit, :update, :destroy]

  def index
    @check_out = false
    @swim_records = SwimRecord.where(completed: false)
    index_respond_to_format_methods
  end

  def records
    @records = SwimRecord.where(completed: true)
    records_respond_to_format_methods
  end

  def new
    @swim_record = SwimRecord.new
  end

  def create
    swim_record_params_create
    @swim_record.swimmer.save
    @swim_record.save ? (redirect_to swimmers_path) : create_and_update_json_else
  end

  def update
    swim_record_update? ? swim_record_if_logic : create_and_update_json_else
  end

  def destroy
    @swim_record.destroy
    respond_to do |format|
      format.html { redirect_to swim_records_url }
      format.json { head :no_content }
    end
  end

  private

  include ApplicationHelper
  include SwimRecordsHelper

  def set_swim_record
    @swim_record = SwimRecord.find(params[:id])
  end

  def swim_record_update?
    @swim_record.update(swim_record_params)
  end

  def swim_record_params_create
    @swim_record = SwimRecord.new(swim_record_params)
    @swim_record.check_in_user_id = current_user.id
    @swim_record.check_in_first_name = current_user.first_name
    @swim_record.check_in_last_name = current_user.last_name
    @swim_record.check_in = Time.now
    @swim_record.swimmer.swimmer_checked_in = true
  end

  def swim_record_if_logic
    swim_record_params_update
    swimmer_params_update
    render :show
  end

  def swim_record_params_update
    @swim_record.update_attribute(:check_out, Time.now)
    @swim_record.update_attribute(:check_out_user_id, current_user.id)
    @swim_record.update_attribute(:check_out_first_name,
                                  current_user.first_name)
    @swim_record.update_attribute(:check_out_last_name, current_user.last_name)
  end

  def swimmer_params_update
    @swim_record.swimmer.swimmer_checked_in = false
    @swim_record.swimmer.save
  end

  def create_and_update_json_else
    render json: @swim_record.errors, status: :unprocessable_entity
  end

  def index_respond_to_format_methods
    respond_to do |format|
      format.html
      format.json
    end
  end

  def records_respond_to_format_methods
    respond_to do |format|
      format.html
      format.json
      format.csv { render csv: @records, filename: 'records' }
    end
  end
end
