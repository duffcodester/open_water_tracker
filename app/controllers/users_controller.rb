class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def monitors
  end

  def create
    @user = User.new(user_params)
    user_setup(@user)
  end

  def update
    user_setup(@user)
  end

  private

  include UsersHelper

  def user_setup(user)
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save!
    if user.update_attributes(user_params)
      render json: user.as_json
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
