module AppsHelper

  def render_app_show(user,app)
    render :partial => user_app_path(user,app), :locals => { :app => app }, :controller=>"apps", :action=>"show", modal: true
  end

end
