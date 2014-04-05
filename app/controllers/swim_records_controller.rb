class SwimRecordsController < ApplicationController
  before_action :set_swim_record, only: [:show, :edit, :update, :destroy]

  def index
    @check_in = false
    @check_out = true
    @swim_records = SwimRecord.where(completed: false)
  end

  def records
    @records = SwimRecord.where(completed: true)
    respond_to do |format|
      format.html
      format.json
      format.csv do
        render csv: @records, filename: 'records'
      end
    end
  end

  def show
  end

  def new
    @swim_record = SwimRecord.new
  end

  def edit
  end

  def create
    @swim_record = SwimRecord.new(swim_record_params)
    @swim_record.check_in_user_id = current_user.id
    @swim_record.check_in = Time.now

    if @swim_record.save
      render :show
    else
      render json: @swim_record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @swim_record.update(swim_record_params)
      @swim_record.update_attribute(:check_out, Time.now)
      @swim_record.update_attribute(:check_out_user_id, current_user.id)
      render :show
    else
      render json: @swim_record.errors, status: :unprocessable_entity
    end
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
end
