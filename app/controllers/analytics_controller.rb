class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show, :edit, :update, :destroy]

  def index
    @analytics = Analytic.all
  end

  def show
  end

  def new
    @analytic = Analytic.new
  end

  def edit
  end

  def create
    @analytic = Analytic.new(analytic_params)

    respond_to do |format|
      if @analytic.save
        format.html { redirect_to @analytic }
        format.json { render action: 'show', status: :created, location: @analytic }
      else
        format.html { render action: 'new' }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @analytic.update(analytic_params)
        format.html { redirect_to @analytic }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @analytic.destroy
    respond_to do |format|
      format.html { redirect_to analytics_url }
      format.json { head :no_content }
    end
  end

  private
    include ApplicationHelper
    include AnalyticsHelper

    def set_analytic
      @analytic = Analytic.find(params[:id])
    end
end
