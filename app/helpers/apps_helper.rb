module AppsHelper

  def render_app_show(app)
    render :partial => app_path, :locals => { :app => app }
  end

end
