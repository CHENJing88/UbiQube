class UserAppRolesController < ApplicationController

  def create
    @user_app_role=UserAppRole.find(params[:id])
    @user=@user_app_role.users.build(user_param)
    @role=@user_app_role.roles.build(role_param)

    respond_to do |format|
    if @user_app_role.save

      format.html { :notice => 'UserAppRole was successfully created.' }
      format.xml  { :status => :created, :location => @user_app_role }
      format.js

    else
      render root_url
    end
  end
end

private
  def user_param
    params.require(:user).permit(:id)
  end
  def role_param
    params.require(:role).permit(:id)
  end
