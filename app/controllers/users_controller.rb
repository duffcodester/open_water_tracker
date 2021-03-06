class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def index
    render json: User.where(account_id: current_user.account_id)
  end

  def monitors
  end

  def create
    @user = User.new(user_params)
    user_setup(@user)
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user.as_json
      flash[:success] = 'Monitor has been updated'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy!
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  include UsersHelper


  def set_user
    @user = User.find(params[:id])
  end

  def user_setup(user)
    user.account_id = current_user.account_id
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save!
    if user.update_attributes(user_params)
      flash[:success] = 'Monitor has been created'
      render json: user.as_json
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
