module AppsHelper

  def render_app_show(user,app)
    render :partial => app_path(app), :locals => { :app => app }, :controller=>"apps", :action=>"show", modal: true
  end

  def app_valide?(app)
    if app.etape_app_id > 2
      return true
    else
      return false
  end


end
