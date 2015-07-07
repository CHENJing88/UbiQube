class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]



  def index
    
    require 'net/ldap'
    ldap = Net::LDAP.new :host => "ldap.univ-tours.fr",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=rails_conn,ou=applis,dc=univ-tours,dc=fr",
           :password => "s4cor;7Xvk2qSdrq"
    }

  if ldap.bind
    #filter = Net::LDAP::Filter.eq( "uid", current_user[:uid] )
    filter = Net::LDAP::Filter.eq( "UFRComposante", "DTIC" )
    treebase = "ou=people,dc=univ-tours,dc=fr"
    @results = ldap.search( :base => treebase, :filter => filter )
  else
      # authentication failed
	logger.debug("non")
  end

  @users = User.all


  end

  def show
      @user = User.find(params[:id])
  end

  def mesapps
    @user = User.find(session[:user_id])
    @mesapps=@user.user_app_roles.includes(:apps,:roles)

  end

private
  def user_param
    params.require(:user).permit(:uid, mesapps_attributes[:user_id,:app_id,:role_id])
  end


end
