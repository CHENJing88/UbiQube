require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  setup do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:cas]
  end
  # Routing test


  test "should get new" do
    get :new
    assert_routing '/auth/cas' , {controller: "sessions", action: "new"}
  end

  test "should create session" do
      assert_nil assigns(session[:user_id])
      post :create, provider: :cas
      assert_not_nil assigns(session[:user_id])


    assert_redirected_to mesapps_path(session[:user_id])
    assert_equal 'Sign in!', flash[:notice]
  end

  test "should failure session" do
    assert_redirected_to root_url
  end

  test "should destroy session" do
    assert_not_nil assigns(session[:user_id])
    delete :destroy
    assert_nil assigns(session[:user_id])
    assert_redirected_to 'https://cas.univ-tours.fr/cas/logout?service=http://ubiqube.univ-tours.fr'
  end
  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @app = nil
  end
end
