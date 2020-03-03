class UsersController < ApplicationController
  def show
    if session[:user_id].nil?
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end

  def new
  end
end
