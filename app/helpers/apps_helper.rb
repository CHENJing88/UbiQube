module AppsHelper

  def render_app_show(user,app)
    render :partial => app_path(app), :locals => { :app => app }, :controller=>"apps", :action=>"show", modal: true
  end

end
