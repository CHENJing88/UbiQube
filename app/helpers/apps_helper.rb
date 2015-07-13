include ApplicationHelper

module AppsHelper

  def app_valide?(app)
    if app.etape_app.id > 2
      return true
    else
      return false
    end
  end


end
