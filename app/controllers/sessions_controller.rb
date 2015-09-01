class SessionsController < ApplicationController

  def new
    redirect_to '/auth/cas'
  end

  def create
    if ldap_filtre("UFRComposante", "DTIC") != nil
      auth = request.env["omniauth.auth"]
      user = User.where(:provider => auth['provider'],
                        :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
      reset_session
      session[:user_id] = user.id
      #redirect_to root_url, :notice => 'Signed in!'
      #redirect à la page de mes Apps
      redirect_to mesapps_url(user.id), :notice => 'Signed in!'
    else
      Session.failure
    end

  end

  def destroy
    reset_session
    redirect_to 'https://cas.univ-tours.fr/cas/logout?service=http://ubiqube.univ-tours.fr'
    #redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :error => "Authentication error: #{params[:message].humanize}"
  end

end
