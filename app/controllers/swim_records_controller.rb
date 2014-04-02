class SwimRecordsController < ApplicationController
  before_action :set_swim_record, only: [:show, :edit, :update, :destroy]

  def index
    @swim_records = SwimRecord.where(completed: false)
      respond_to do |format|
        format.html
        format.json
      end
  end

  def records
    @records = SwimRecord.where(completed: true)
      respond_to do |format|
        format.html
        format.json
        format.csv { render csv: @records, filename: records }
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

    respond_to do |format|
      if @swim_record.save
        format.html { redirect_to swim_records_path, notice: 'Swimmer has been checked out.' }
        format.json { render action: 'show', status: :created, location: @swim_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @swim_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @swim_record.update(swim_record_params)
        format.html { redirect_to @swim_record, notice: 'Swim record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swim_record.errors, status: :unprocessable_entity }
      end
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

  def set_swim_record
    @swim_record = SwimRecord.find(params[:id])
  end

  def swim_record_params
    params.require(:swim_record).permit(:swimmer_id,
                                        :check_in,
                                        :check_out,
                                        :check_in_user_id,
                                        :check_out_user_id,
                                        :completed)
  end
end
