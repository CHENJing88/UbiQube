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
  #def admins_only(&block)
  #  block.call if current_user.role.nom == "Admin"
  #  nil
  #end
  def ldap_filtre(titre, var)
    if ldap.bind
      #filter = Net::LDAP::Filter.eq( "uid", current_user[:uid] )
      #filter = Net::LDAP::Filter.eq( "ufrcomposante", "DTIC" )
      filter = Net::LDAP::Filter.eq( titre, var )
      treebase = "ou=people,dc=univ-tours,dc=fr"
      @results = ldap.search( :base => treebase, :filter => filter )
      return @results
    else
        # authentication failed
         logger.debug("ldap authentication failed")
    end
  end


end
