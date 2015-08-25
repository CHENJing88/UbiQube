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

  def resp_fonc?(uars)
     #uar.role_id == 3 ? true : false
     uars.each do |uar|
       if uar.role_id == 3
         return uar
       end
     end

     return UserAppRoles.create(role_id: 3, user_id: uars[1].user_id, app_id: uars[1].app_id)

  end

  def resp_tech?(uars)
    uars.each do |uar|
      if uar.role_id == 4
        return uar
      end
    end

    return UserAppRoles.create(role_id: 3, user_id: uars[1].user_id, app_id: uars[1].app_id)
  end

end
