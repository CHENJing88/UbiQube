ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def valid_cas_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode=true
      OmniAuth.config.mock_auth[:cas]= OmniAuth::Builder
      omniauth_hash = { 'provider' => 'cas',
                        'url'=>'https://cas.univ-tours.fr/cas',
                        'uid' => 'jchen',
                        'info' => {
                            'name' => 'jing',
                            'email' => 'hi@jingtherobot.com',
                            'nickname' => 'JingTheRobot'
                         }
                      }
      }
      OmniAuth.config.add_mock(:cas, omniauth_hash)
    end
  end






end
