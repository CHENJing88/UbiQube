module AppsHelper

  def render_app_show(user,app)
    render :partial => user_app_path(user), :locals => { :app => app }
  end

end
