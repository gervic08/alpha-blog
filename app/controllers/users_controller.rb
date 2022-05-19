# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: %i[index create new]
  before_action :require_user, only: %i[update edit destroy]
  before_action :require_same_user, only: %i[update edit destroy]

  def index
    @users = User.order(:username).page params[:page]
  end

  def show
    @user
    @articles = @user.articles.order(:title).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alphablog #{@user.username}. You´re successfully Signed Up!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your user profile was successfully updated."
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "#{@user.username} account was succesfully deleted"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    unless current_user == @user || current_user.admin?
      flash[:alert] = "Your user is not allowed to do that"
      redirect_to user_path
    end
  end
end
