include ApplicationHelper

module AppsHelper

  def app_valide?(app)
    app.etape_app.id > 2 ? true : false
  end

  def show_non_blank_field(label, value)
    "<tr><td>#{label}</td><td><%= #{value} %></td></tr>" if !value.blank?
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
