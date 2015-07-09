class ServiceInAppController < ApplicationController


  def edit_tech
    @service_in_app=ServiceInApp.find(params[:id])
    @app=App.find(params[:id])

    respond_to do |format|
      format.html
      format.js{ render :layout => false }
    end
  end

end
