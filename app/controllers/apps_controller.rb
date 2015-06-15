class AppsController < ApplicationController

  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def create
    @app=App.new(app_params)

  end

  def edit
    @app=App.find(params[:id])
  end


  private

    def app_params
      params.require(:app).permit(:nom)

    end
end
