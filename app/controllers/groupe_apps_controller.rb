class GroupeAppsController < ApplicationController
  # GET /groupe_apps
  # GET /groupe_apps.xml
  def index
    @groupe_apps = GroupeApp.all
  end

  # GET /groupe_apps/1
  # GET /groupe_apps/1.xml
  def show
    @groupe_app = GroupeApp.find(params[:id])

  end
  # GET /groupe_apps/1
  # GET /groupe_apps/1.xml
  def edit
    @groupe_app=GroupeApp.find(params[:id])
  end

  # GET /groupe_apps/new
  # GET /groupe_apps/new.xml
  def new
    @groupe_app = GroupeApp.new
    @groupe_app.app.build
    @groupe_app.groupe_user.build
  end
  # GET /groupe_apps/1
  # GET /groupe_apps/1.xml
  def create
    @groupe_app=GroupeApp.new(relation_param)

    respond_to do |format|
    if @groupe_app.save
      format.html { :notice => 'GroupeApp was successfully created.' }
      format.js
    else
      render root_url
    end

  end
  # PUT /groupe_apps/1
  # PUT /groupe_apps/1.xml
  def update
    @groupe_app = GroupeApp.find(params[:id])
    #@app.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
    respond_to do |format|
      if @groupe_app.update_attributes(relation_param)
          format.html { redirect_to mesapps_url(current_user), :notice => 'GroupeApp was successfully updated' }
          format.json { render :action => "show", :status => :updated, :location => @groupe_app }
          format.js
        else
          format.html { redirect_to edit_app_path(@groupe_app) }
          format.json { render :action => @groupe_app.errors.full_messages, :status => :unprocessable_entity}
          format.js
        end
    end
  end

  # DELETE /groupe_apps/1
  # DELETE /groupe_apps/1.xml
  def destroy
    @groupe_app = GroupeApp.find(params[:id])
    if @groupe_app.destroy then
      respond_to do |format|
        format.html {redirect_to mesapps_url(current_user), :notice => 'GroupeApp was successfully deleted'}
        format.js
      end
    end

  end

end

private
  def relation_param
    params.require(:groupe_app).permit(:groupe_user_id,:app_id)
    #params[:id]
  end
end
