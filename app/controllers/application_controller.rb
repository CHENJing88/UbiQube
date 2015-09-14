class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # si user n'est pas autorisé à certain action
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403,:layout => false
    end
  helper_method :current_user
  helper_method :correct_user?
  helper_method :user_signed_in?
  #helper_method :current_ability
  helper_method :ldap
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
        redirect_to root_url, :error => "Accès refussè. Login, s'il vous plaît."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :notice => 'Vous avez besoin de se connecter pour accèder à cette page.'
      end
    end


    def authorize_admin!
      authenticate_user!
      unless current_user.uid == Application.find(params[:uid_admin])
        redirect_to root_path, :error => "Vous devez être connecté en tant que l'administrateur pour cet opération"
      end
    end

    def current_ability
      @current_ability ||= ::Ability.new(current_user)
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
