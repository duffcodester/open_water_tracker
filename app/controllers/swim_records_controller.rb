class SwimRecordsController < ApplicationController
  before_action :set_swim_record, only: [:show, :edit, :update, :destroy]

  # GET /swim_records
  # GET /swim_records.json
  def index
    @swim_records = SwimRecord.all
  end

  # GET /swim_records/1
  # GET /swim_records/1.json
  def show
  end

  # GET /swim_records/new
  def new
    @swim_record = SwimRecord.new
  end

  # GET /swim_records/1/edit
  def edit
  end

  # POST /swim_records
  # POST /swim_records.json
  def create
    @swim_record = SwimRecord.new(swim_record_params)

    respond_to do |format|
      if @swim_record.save
        format.html { redirect_to @swim_record, notice: 'Swim record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @swim_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @swim_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swim_records/1
  # PATCH/PUT /swim_records/1.json
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

  # DELETE /swim_records/1
  # DELETE /swim_records/1.json
  def destroy
    @swim_record.destroy
    respond_to do |format|
      format.html { redirect_to swim_records_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swim_record
      @swim_record = SwimRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swim_record_params
      params.require(:swim_record).permit(:swimmer_id,
                                          :check_in,
                                          :check_out,
                                          :check_in_user_id,
                                          :check_out_user_id)
    end
end
