class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @check_in = true
    @check_out = true
    respond_to do |format|
      format.html
      format.json
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
    if @user.update_attributes(user_params)
      sign_in(@user, bypass: true) if @user == current_user
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
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
end
