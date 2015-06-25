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
    respond_modal_with @app
  end

  # POST /apps
  # POST /apps.xml
  def create
    #app_params.permit!

    @app=App.new(params[:app])
    respond_modal_with @app, location: mesapps_url(session[:user_id])
    #@app= current_user.user_app_roles.apps.build(params[:app])
    #respond_to do |format|
    #  if @app.save
    #    format.html { redirect_to mesapps_url(session[:user_id]), :notice => 'App was successfully created.' }
    #    format.xml  { render :xml => @app, :status => :created, :location => @app }
    #    format.js
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @app.errors, :status => :unprocessable_entity }
    #    format.js
    #  end
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

    def respond_modal_with(*args,&blk)
      options=args.extract_options!
      options[:responder]=ModalResponder
      responds_with *args, options, &blk
    end
end
