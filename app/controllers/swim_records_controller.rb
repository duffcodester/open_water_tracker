class SwimRecordsController < ApplicationController
  before_action :set_swim_record, only: [:show, :edit, :update, :destroy]

  def index
    @swim_records = SwimRecord.joins(:swimmer).where(swimmers: {account_id: current_user.account_id}, completed: false)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @swim_record = SwimRecord.new
  end

  def create
    @swim_record = SwimRecord.new(swim_record_params)

    if @swim_record.save
      render json: @swim_record
    else
      render json: @swim_record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @swim_record.update(swim_record_params)
      render json: @swim_record
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
