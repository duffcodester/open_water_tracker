class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]

  def index
    @swimmers = Swimmer.all
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

  def destroy
    @swimmer.destroy
    respond_to do |format|
      format.html { redirect_to swimmers_url }
      format.json { head :no_content }
    end
  end

  private
  include SwimmersHelper

  def set_swimmer
    @swimmer = Swimmer.find(params[:id])
  end
end