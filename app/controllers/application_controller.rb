class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end


    def authorize_admin!
      authenticate_user!
      unless current_user.role.nom == "Admin"
        redirect_to root_path,:alert => "Vous devez être connecté en tant qu'administrateur pour cet opération"
      end
    end

    def ldap
      require 'net/ldap'
      @ldap = Net::LDAP.new :host => "ldap.univ-tours.fr",
       :port => 389,
       :auth => {
             :method => :simple,
             :username => "cn=rails_conn,ou=applis,dc=univ-tours,dc=fr",
             :password => "s4cor;7Xvk2qSdrq"
      }


    end

    def ldap_filtre(titre, var)
      if ldap.bind
        #filter = Net::LDAP::Filter.eq( "uid", current_user[:uid] )
        #filter = Net::LDAP::Filter.eq( "UFRComposante", "DTIC" )
        filter = Net::LDAP::Filter.eq( titre, var )
        treebase = "ou=people,dc=univ-tours,dc=fr"
        @results = ldap.search( :base => treebase, :filter => filter )
        return @results
      else
          # authentication failed
    	     logger.debug("authentication failed")
      end
    end
end
