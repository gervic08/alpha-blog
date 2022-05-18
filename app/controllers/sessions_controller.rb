# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "You´re succesfully logged in AlphaBlog"
      redirect_to user
    else
      flash.now[:alert] = "Check your credentials and re-try"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Succesfully logged out"
    redirect_to root_path
  end
end
