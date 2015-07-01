class UserAppRolesController < ApplicationController

  def index
    @user_app_roles = UserAppRole.all
  end

  def show
    @user_app_role = UserAppRole.find(params[:id])

  end

  def edit
    @user_app_role=UserAppRole.find(params[:id])
  end

  # GET /apps/new
  # GET /apps/new.xml
  def new
    @user_app_role = UserAppRole.new
    @user_app_role.apps.build
    @user_app_role.users.build
    @user_app_role.roles.build
  end

  def create
    @user_app_role=UserAppRole.new(relation_param)

    respond_to do |format|
    if @user_app_role.save
      format.html { :notice => 'UserAppRole was successfully created.' }
      format.js
    else
      render root_url
    end

  end
end

private
  def relation_param
    params.require(:user_app_role).permit(:user_id,:app_id,:role_id)
  end
