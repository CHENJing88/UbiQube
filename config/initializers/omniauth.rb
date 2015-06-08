Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
  provider 	:cas, 
		url: 'https://cas.univ-tours.fr/cas', 
		name_key: 'uid'
end
