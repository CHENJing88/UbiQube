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
    @mesapps=@user.user_app_roles.includes(:apps,:roles)
    @app= current_user.user_app_roles.apps.build if signed_in?
  end

end
