class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @ldap_info=ldap_filtre("uid", current_user[:uid] )
  end

  def mesapps
    @user = User.find(session[:user_id])
    @mesapps=@user.user_app_roles.includes(:apps,:roles)
  end

  def dsi
    @user = User.find(session[:user_id])
    @apps_envois=App.where(:envoie=>true)

  end

private
  def user_param
    params.require(:user).permit(:uid, mesapps_attributes[:user_id,:app_id,:role_id])
  end


end
