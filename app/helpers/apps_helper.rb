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

  def find_etape_id(nom)
    EtapeApp.where(nom: nom).first.id
  end

  def find_etat_id(nom)
    EtatApp.where(nom: nom).first.id
  end

end
