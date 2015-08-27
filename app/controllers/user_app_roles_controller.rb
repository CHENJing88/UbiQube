class UserAppRolesController < ApplicationController

  # GET /user_app_roles
  # GET /user_app_roles.xml
  def index
    @user_app_roles = UserAppRole.all
  end

  # GET /user_app_roles/1
  # GET /user_app_roles/1.xml
  def show
    @user_app_role = UserAppRole.find(params[:id])

  end
  # GET /user_app_roles/1
  # GET /user_app_roles/1.xml
  def edit
    @user_app_role=UserAppRole.find(params[:id])
  end

  # GET /user_app_roles/new
  # GET /user_app_roles/new.xml
  def new
    @user_app_role = UserAppRole.new
    @apps=@user_app_role.apps.build
    @users=@user_app_role.users.build
    @roles=@user_app_role.roles.build
  end
  # GET /user_app_roles/1
  # GET /user_app_roles/1.xml
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
  # PUT /user_app_roles/1
  # PUT /user_app_roles/1.xml
  def update
    @user_app_role = UserAppRole.find(params[:id])
    #@app.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
    respond_to do |format|
      if @user_app_role.update_attributes(app_params)
          format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully updated' }
          format.json { render :action => "show", :status => :updated, :location => @user_app_role }
          format.js
        else
          format.html { redirect_to edit_app_path(@user_app_role) }
          format.json { render :action => @user_app_role.errors.full_messages, :status => :unprocessable_entity}
          format.js
        end
    end
  end

  # DELETE /user_app_roles/1
  # DELETE /user_app_roles/1.xml
  def destroy
    @user_app_role = UserAppRole.find(params[:id])
    if @user_app_role.destroy then
      respond_to do |format|
        format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully deleted'}
        format.js
      end
    end

  end

end

private
  def relation_param
    params.require(:user_app_role).permit(:id, :user_id,:app_id,:role_id)
    #params[:id]
  end
