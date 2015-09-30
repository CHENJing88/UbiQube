module UserAppRolesHelper

  # examiner est-ce que user est le responsable Fonctionnel de l'App
  def resp_fonc?(app)
    @app=app
     #uar.role_id == 3 ? true : false
     @app.user_app_roles.each do |user_app_role|
       # tester si App a un responsable Fonctionnel
       if user_app_role.role_id == 3
         return user_app_role
       end
     end
     # sinon alouer un responsable Fonctionnel pour l'App(non user)
     return @app.user_app_roles.build(role_id: 3)

  end
  # examiner est-ce que user est le responsable technique de l'App
  def resp_tech?( app)
    @app=app
    @app.user_app_roles.each do |user_app_role|
      if user_app_role.role_id == 4
        return user_app_role
      end
    end
    return @app.user_app_roles.build(role_id: 4)
  end
end
