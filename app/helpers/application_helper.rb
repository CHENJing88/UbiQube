require 'net/ldap'

module ApplicationHelper

  def flash_class(flash_type)
    {
      :notice => "alert alert-info",
      :success => "alert alert-success",
      :error => "alert alert-error",
      :alert => "alert alert-block",
      :warning=>"alert alert-warning"
     }[flash_type.to_sym] || flash_type.to_s
  end

  # retourner true si current_user est admin
  def admin?
    return true if current_user.uid.to_s == Application.first.uid_admin.to_s
  end

  # retourner true si current_user est dsi
  def dsi?
    return true if current_user[:uid].to_s== Application.first.uid_dsi.to_s
  end

  def ldap_auth(uid, local)
    if ldap.bind
      filter = Net::LDAP::Filter.eq( "uid", uid )
      #filter = Net::LDAP::Filter.eq( "ufrcomposante", "DTIC" )
      treebase = "ou=people,dc=univ-tours,dc=fr"
      @results = ldap.search( :base => treebase, :filter => filter )
      return @results[0].ufrcomposante[0].eql? local
    else
        # authentication failed
         logger.debug("ldap authentication filter failed")
    end
  end

  # Limit le lecture d'info d'user
  def ldap_filtre(titre, var)
    if ldap.bind
      #filter = Net::LDAP::Filter.eq( "uid", current_user[:uid] )
      #filter = Net::LDAP::Filter.eq( "ufrcomposante", "DTIC" )
      filter = Net::LDAP::Filter.eq( titre, var )
      treebase = "ou=people,dc=univ-tours,dc=fr"
      #ldap.search( :base => treebase, :filter => filter,:return_result => false ) do |item|
      #  emails << (item.mail.is_a?(Array) ? item.mail.first.to_s.strip : item.mail.to_s.strip)
      #end
      @results = ldap.search( :base => treebase, :filter => filter )
      return @results
    else
        # authentication failed
         logger.debug("ldap authentication filter failed")
    end
  end

end
