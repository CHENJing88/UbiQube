require 'test_helper'

class ServiceInAppsControllerTest < ActionController::TestCase
  setup do
    @service_in_app= service_in_apps(:ssh)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_in_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_in_app" do
    assert_difference('ServiceInApp.count') do
      post :create, service_in_app: {  }
    end

    assert_redirected_to service_in_app_path(assigns(:service_in_app))
  end

  test "should show service_in_app" do
    get :show, id: @service_in_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_in_app
    assert_response :success
  end

  test "should update service_in_app" do
    patch :update, id: @service_in_app, service_in_app: {  }
    assert_redirected_to service_in_app_path(assigns(:service_in_app))
  end

  test "should destroy service_in_app" do
    assert_difference('ServiceInApp.count', -1) do
      delete :destroy, id: @service_in_app
    end

    assert_redirected_to service_in_apps_path
  end

  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @service_in_app= nil
  end
end
