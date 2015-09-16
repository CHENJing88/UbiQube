require 'net/ldap'

module SessionsHelper
  # Limit le lecture d'info d'user
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

end
