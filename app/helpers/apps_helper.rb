module AppsHelper

  def render_app_show(app)
    render :partial => "app/show", :locals => { :app => app }
  end

end
