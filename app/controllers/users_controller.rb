class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @check_in = true
    @check_out = true
    users_respond_to_format_methods(@users)
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
    @user.update_attributes(user_params) ? user_update : (render 'edit')
  end

  def show
    @check_in = true
    @check_out = true
  end

  private

  include ApplicationHelper
  include UsersHelper

  def set_user
    @user = User.find(params[:id])
  end

  def users_respond_to_format_methods(view)
    respond_to do |format|
      format.html
      format.json do
        render json: oj_dumper(view)
      end
    end
  end

  def user_update
    sign_in(@user, bypass: true) if @user == current_user
    flash[:success] = 'Profile updated'
    redirect_to @user
  end

  def oj_dumper(view)
    Oj.dump(view.select([:id, :last_name, :first_name, :email, :phone_number,
                         :admin]), mode: :compat)
  end
end
