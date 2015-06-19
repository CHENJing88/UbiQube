class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def mesapps
    @user = User.find(session[:user_id])
    @mesapps=@user.apps
    @mesapps.includes(:roles)
  end

end
