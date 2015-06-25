class AppsController < ApplicationController

  def index
    @apps = App.order(created_at: :desc)
  end

  def show
    @app = App.find(params[:id])

  end

  def edit
    @app=App.find(params[:id])
  end

  # GET /apps/new
  # GET /apps/new.xml
  def new
    @app = App.new
    @user_app_roles=@app.user_app_roles.build
    @user_app_roles.app_id=@app.id
  end

  # POST /apps
  # POST /apps.xml
  def create
    #app_params.permit!

    @app=App.new(app_params)
    
    @app= @app.user_app_roles.build(relation_params)
    respond_to do |format|
      if @app.save
        format.html { redirect_to mesapps_url(session[:user_id]), :notice => 'App was successfully created.' }
        format.xml  { render :xml => @mesapps, :status => :created, :location => @user }
        format.js { render :action => 'mesapps', :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @app.errors, :status => :unprocessable_entity }
        format.js { render :action => @app.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /apps/1
  # PUT /apps/1.xml
  def update
    @app = App.find(params[:id])

      if @app.update_attributes(params[:app])
        redirect_to mesapps_url(current_user[:id]), :notice => 'App was successfully updated.'

      else
        render :action => "edit"
      end

  end

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    redirect_to mesapps_url(current_user[:id]), :notice => 'App was successfully deleted'

  end

  private

    def app_params
      params.require(:app).permit(:nom,:description)
    end
    def relation_params
      params.require(:user_app_roles).permit(:user_id,:role_id,:app_id)
    end

end
