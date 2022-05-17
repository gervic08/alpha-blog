# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params [:sessions][:password])
        flash[:notice] = "You´re succesfully logged in AlphaBlog"
        redirect_to user
    else
      flash.now = "Check your credentials and re-try"
      render 'new'
    end
  end

  def destroy
  end
end
