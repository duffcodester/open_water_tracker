class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    respond_to do |format|
      format.html
      format.json { render json: User.all }
    end
    @check_in = true
    @check_out = true
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    message = 'User account was successfully created.'
    handle_action(@user, message, :new, &:save)
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Employee Profile updated'

      respond_to do |format|
        format.html { redirect_to @user }

        format.json do
          render json: @user
        end
      end
    else
      render 'edit'
    end
  end

  def show
    @check_in = true
    @check_out = true
  end

  private

  include UsersHelper

  def set_user
    @user = User.find(params[:id])
  end
end
