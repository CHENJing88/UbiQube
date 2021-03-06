class AppsController < ApplicationController
  before_filter :authenticate_user!
  load_resource  # @app automatically set to App.find(params[:id])
  # GET /apps
  # GET /apps
  def index
    #@apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.xml
  def show
    #@app = App.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  # GET /apps/1/edit
  # GET /apps/1/edit.xml
  def edit
    #@app=App.find(params[:id])
    @user_app_roles=@app.user_app_roles.build

    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end

  end

  # GET /apps/new
  # GET /apps/new.xml
  def new
    @app = App.new
    @user_app_roles=@app.user_app_roles.build
    @app.users.build
    @app.roles.build
    #2.times { @app.user_app_roles.build }
    #@service_in_apps = @app.service_in_apps.build
  end

  # POST /apps
  # POST /apps.xml
  def create
    #app_params.permit!
    @app=App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully created.' }
        format.js { render :action => 'mesapps', :status => :created, :location => @user }
      else
        format.html { redirect_to mesapps_url(current_user), :notice => 'Create App was failed.' }
        format.js { render :action => @app.errors, :status => :unprocessable_entity }
      end
    end

  end
  # PUT /apps/1
  # PUT /apps/1.xml
  def update
    #@app = App.find(params[:id])
    authorize! :update, @app
    respond_to do |format|
      #if App.new(app_params).valid?
      if   @app.update_attributes(app_params)
          format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully updated' }
          format.json { render :action => "show", :status => :updated, :location => @app }
          format.js
        else
          format.html { redirect_to mesapps_url(current_user), :notice => 'App was failed updated' }
          format.json { render :action => @app.errors.full_messages, :status => :unprocessable_entity}
          format.js { render :layout=>false,template:'apps/edit.js.erb'}
        end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    #@app = App.find(params[:id])
    if @app.destroy then
      respond_to do |format|
        format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully deleted'}
        format.js { render :layout=>false,template:'apps/destroy.js.erb'}
      end
    end

  end

  private

    def app_params
      params.require(:app).permit(:nom,:niveau, :description,:envoie,:etape_app_id,:etat_app_id,:groupe_user_id,
      user_app_roles_attributes:[:id,:app_id,:user_id,:role_id,:_destroy])
    end

end
