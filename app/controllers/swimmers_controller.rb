class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]

  # GET /swimmers
  # GET /swimmers.json
  def index
    @swimmers = Swimmer.all
  end

  # GET /swimmers/1
  # GET /swimmers/1.json
  def show
  end

  # GET /swimmers/new
  def new
    @swimmer = Swimmer.new
  end

  # GET /swimmers/1/edit
  def edit
  end

  # POST /swimmers
  # POST /swimmers.json
  def create
    @swimmer = Swimmer.new(swimmer_params)

    respond_to do |format|
      if @swimmer.save
        format.html { redirect_to @swimmer, notice: 'Swimmer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @swimmer }
      else
        format.html { render action: 'new' }
        format.json { render json: @swimmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swimmers/1
  # PATCH/PUT /swimmers/1.json
  def update
    respond_to do |format|
      if @swimmer.update(swimmer_params)
        format.html { redirect_to @swimmer, notice: 'Swimmer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swimmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.json
  def destroy
    @swimmer.destroy
    respond_to do |format|
      format.html { redirect_to swimmers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimmer
      @swimmer = Swimmer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swimmer_params
      params.require(:swimmer).permit(:first_name, :last_name, :usms_number, :lmsc)
    end
end
