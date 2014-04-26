class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]

  def index
    @check_in = false
    @swimmers = Swimmer.where(in_state: params[:in_state] == 'true')
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
    @swimmer.save ? (render :show) : create_and_update_json_else
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
