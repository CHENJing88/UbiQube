class AppsController < ApplicationController

  def index
    @apps = App.all
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

  end

  # POST /apps
  # POST /apps.xml
  def create
    app_params.permit!

    #@app=App.new(app_params)
    @app= current_user.user_app_roles.apps.build(params[:app])

      if @app.save
        redirect_to mesapps_url(current_user[:id]), :notice => 'App was successfully created.'

      else
        render :action => "new"

      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @app = App.find(params[:id])

      if @app.update_attributes(params[:app])
        redirect_to mesapps_url(current_user[:id]), :notice => 'App was successfully updated.' }

      else
        render :action => "edit"
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    redirect_to mesapps_url(current_user[:id]), :notice => 'App was successfully deleted'
    end
  end

  private

    def app_params
      params.require(:app).permit(:nom)

    end
end
