class AppsController < ApplicationController

  def index
    @apps = App.all
    #@apps.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
  end

  def show
    @app = App.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  def edit
    @app=App.find(params[:id])
    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

  # GET /apps/new
  # GET /apps/new.xml
  def new
    @app = App.new
    @app.user_app_roles.build
  end

  # POST /apps
  # POST /apps.xml
  def create
    #app_params.permit!

    @app=App.new(app_params)

    #@app.build(params[:user_app_roles])
    #@app.user_app_roles=UserAppRole.new(params[:user_app_roles])
    #@app.user_app_roles.build(params[:app_id])
    #@app.user_app_roles＝@user_app_roles
    #@app.build(params[:user_app_roles])
    #@app.build(params[:user_app_roles])
    #@app.build(params[:user_app_roles])

    respond_to do |format|
      if @app.save
        format.html { redirect_to mesapps_url(current_user), :notice => 'App was successfully created.' }
        format.js { render :action => 'mesapps', :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.js { render :action => @app.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /apps/1
  # PUT /apps/1.xml
  def update
    @app = App.find(params[:id])
    @app.sort! {|a,b| a.create_at.to_i <=> b.create_at.to_i}
      if @app.update_attributes(params[:app])
        redirect_to :action=> :show, :id=> @app

      else
        render :action => "edit"
      end

  end

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html {redirect_to mesapps_url(current_user), :notice => 'App was successfully deleted'}
      format.js { render :layout => false, :action => 'mesapps', status: :destroy, :location => @user}
    end


  end


  private

    def app_params
      params.require(:app).permit(:nom,:description,:etape_app_id,:etat_app_id,user_app_roles_attributes:[:user_id,:role_id])
    end


end
