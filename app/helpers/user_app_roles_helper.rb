module UserAppRolesHelper
  def resp_fonc?(app)
    @app=app
     #uar.role_id == 3 ? true : false
     @app.user_app_roles.each do |uar|
       if uar.role_id == 3
         return uar
       end
     end
     #new_uar=UserAppRoles.create(role_id: 3, user_id: uars[1].user_id, app_id: uars[1].app_id)
     @user_app_role=@app.user_app_roles.build(role_id: 3)

     return @user_app_role

  end

  def resp_tech?( app)
    @app=app
    @app.user_app_roles.each do |uar|
      if uar.role_id == 4
        return uar
      end
    end
    #new_uar=UserAppRoles.create(role_id: 4, user_id: uars[1].user_id, app_id: uars[1].app_id)
    @user_app_role=@app.user_app_roles.build(role_id: 4)

    return @user_app_role
  end
end
