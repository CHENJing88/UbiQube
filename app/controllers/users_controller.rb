class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_resource
  def index
    #@users = User.all
  end

  def show
    #@user = User.find(params[:id])
    @ldap_info=ldap_filtre("uid", current_user[:uid] )
  end

  # users/mesapps
  def mesapps
    #@user = User.find(session[:user_id])
    @mesapps=@user.user_app_roles.includes(:app,:role)
    @mesgroupes=@user.user_groupe_users.includes(:groupe_user)
  end

  # users/admin
  def admin
    #@user = User.find(session[:user_id])
    @apps=App.all
  end

  # users/dsi
  def dsi
    #@user = User.find(session[:user_id])
    @apps_envois=App.where(:envoie=>true)
  end

private
  def user_param
    params.require(:user).permit(:uid, mesapps_attributes[:user_id,:app_id,:role_id],
    mesgroupes_attributes[:groupe_user_id,:user_id])
  end

end
