require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "login and browse site" do
    # login via https
    https!
    get "/signin"
    assert_response :success

    post_via_redirect "/login", username: "jing.chen", password: "Ubiqube2015-Jing"
    assert_equal '/users/:id/mesapps', path
    assert_equal 'Signed in!', flash[:notice]

    https!(false)
    get "/"
    assert_response :success
  end

  private

    module CustomDsl
      def browses_site
        get "/"
        assert_response :success
        assert assigns(:apps)
      end
    end

    def login(user)
      open_session do |sess|
        sess.extend(CustomDsl)
        u = users(user)
        sess.https!
        sess.post "/signin", username: "jing.chen", password: "Ubiqube2015-Jing"
        assert_equal '/users/:id/mesapps', sess.path
        sess.https!(false)
      end
    end
end
