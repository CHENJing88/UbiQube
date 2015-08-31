require 'test_helper'

class AppsControllerTest < ActionController::TestCase

  # Routing test
  test "should route to app" do
    assert_routing '/apps/1', {controller: "apps", action: "show", id: "1"}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app" do
    assert_difference('App.count') do
      post :create, app: {  }
    end

    assert_redirected_to mesapps_path(assigns(:app))
  end

  test "should show app" do
    get :show, id: @app
    assert_response :success
  end

  test "should get edit app" do
    get :edit, id: @app
    assert_response :success
  end

  test "should update app" do
    patch :update, id: @app, app: {}
    assert_redirected_to mesapps_path(assigns(:app))
  end

  test "should destroy app" do
    assert_difference('App.count', -1) do
      delete :destroy, id: @app
    end
    assert_redirected_to mesapps_path(assigns(:app))
  end

  # test views
  test "new should render correct layout" do
    get :new
    assert_template  partial: "_new"
  end

  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @app = nil
  end
end
