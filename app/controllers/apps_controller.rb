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
<<<<<<< HEAD
=======
    if @app.save
>>>>>>> 16362a257cc8b0db1284bcb2e5404dfac55dded5


  end

  def edit
    @app=App.find(params[:id])
  end


  private

    def app_params
      params.require(:app).permit(:nom)

    end
end
