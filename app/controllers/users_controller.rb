class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @check_in = true
    @check_out = true
    if stale?(@users)
      users_respond_to_format_methods
    end
  end

  def edit
  end

  def new
    current_user ? @user = User.new : devise_user_render
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

  def devise_user_render
    @user = User.new
    render layout: 'devise'
  end

  def set_user
    @user = User.find(params[:id])
  end

  def users_respond_to_format_methods
    respond_to do |format|
      format.html
      format.json
    end
  end

  def user_update
    sign_in(@user, bypass: true) if @user == current_user
    flash[:success] = 'Profile updated'
    redirect_to @user
  end
end
