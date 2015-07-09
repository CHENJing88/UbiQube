class ServiceInAppController < ApplicationController

  def index
    @service_in_apps = ServiceInApp.all
    #@apps.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
  end

  def show
    @service_in_app = ServiceInApp.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  def edit
    @service_in_app=ServiceInApp.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  def edit_tech
    @service_in_app=ServiceInApp.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  # GET /ServiceInApps/new
  # GET /ServiceInApps/new.xml
  def new
    @service_in_app = ServiceInApp.new
    @service_in_app.user_app_roles.build
  end

  # POST /ServiceInApps
  # POST /ServiceInApps.xml
  def create
    #app_params.permit!

    @service_in_app=ServiceInApp.new(serIN_params)

    #@app.build(params[:user_app_roles])
    #@app.user_app_roles=UserAppRole.new(params[:user_app_roles])
    #@app.user_app_roles.build(params[:app_id])
    #@app.user_app_roles＝@user_app_roles
    #@app.build(params[:user_app_roles])
    #@app.build(params[:user_app_roles])
    #@app.build(params[:user_app_roles])

    respond_to do |format|
      if @service_in_app.save
        format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully created.' }
        format.js { render :action => 'mesapps', :status => :created, :location => @user }
      else
        format.html { render :action => 'new' }
        format.js { render :action => @service_in_app.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /ServiceInApps/1
  # PUT /ServiceInApps/1.xml
  def update
    @service_in_app = ServiceInApp.find(params[:id])
    @service_in_app.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
      if @service_in_app.update_attributes(params[:app])
        format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully updated.' }

      else
        render :action => "edit"
      end

  end

  # DELETE /ServiceInApps/1
  # DELETE /ServiceInApps/1.xml
  def destroy
    @service_in_app = ServiceInApp.find(params[:id])
    if @service_in_app.destroy then
      respond_to do |format|
        format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully deleted'}
        format.js { render :layout=>false,template:'service_in_apps/destroy.js.erb'}
      end
    end



  end

  def edit_tech
    @service_in_app=ServiceInApp.find(params[:id])
    @vm_install_service_in=@service_in_app.vm_install_service_ins.build
    @app=App.find(params[:id])

    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

private
  def serIN_params
    params.require(:service_in_app).permit(:port, apps_attributes[:id])
  end
end
