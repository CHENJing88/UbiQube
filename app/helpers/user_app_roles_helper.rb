module UserAppRolesHelper
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

    return UserAppRoles.create(role_id: 4, user_id: uars[1].user_id, app_id: uars[1].app_id)
  end
end
