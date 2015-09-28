class ApplicationController < ActionController::Base
   helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # si user n'est pas autorisé à certain action
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403,:layout => false
    end
    helper_method :current_user,:correct_user?
    helper_method :user_signed_in?
    helper_method :current_ability
    helper_method :ldap
private
    # current user
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end
    # test current_user est null
    def user_signed_in?
      return true if current_user
    end
    # comparer user login et user en session est le même
    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :error => "Accès refussè. Login, s'il vous plaît."
      end
    end
    # authorisation pour l'admin
    def authorize_admin!
      correct_user?
      unless current_user.uid == Application.find(params[:uid_admin])
        redirect_to root_path, :error => "Vous devez être connecté en tant que l'administrateur pour cet opération"
      end
    end

    def load_and_authorize_resource
     load_resource
     authorize_resource
    end

    def ldap
      @ldap = Net::LDAP.new :host => "ldap.univ-tours.fr",
       :port => 389,
       :auth => {
             :method => :simple,
             :username => "cn=rails_conn,ou=applis,dc=univ-tours,dc=fr",
             :password => "s4cor;7Xvk2qSdrq"
      }
    end

end
