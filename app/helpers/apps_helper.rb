include ApplicationHelper

module AppsHelper

  def app_valide?(app)
    if app.etape_app.id > 2
      return true
    else
      return false
    end
  end

  def find_role(nom)
    Role.where(nom: nom).first.id
  end

  def find_role_name_by_id(role_id)
    Role.where(role_id: role_id).first.nom
  end
end
