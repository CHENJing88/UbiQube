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
    role=Role.where(id: role_id).first.name
    return role.new.nom
  end

  def respfonc?(uar)
     #uar.role_id == 3 ? true : false
     if uar.role_id == 3
       return true
     else
       return false
  end

  def resptech?(uar)
    if uar.role_id == 4
      return true
    else
      return false
  end

end
