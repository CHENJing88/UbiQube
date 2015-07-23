require 'test_helper'

class UserAppRolesControllerTest < ActionController::TestCase

  setup do
    @user_app_role = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_app_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_app_role" do
    assert_difference('UserAppRole.count') do
      post :create, user_app_role: {  }
    end

    assert_redirected_to user_app_role_path(assigns(:user_app_role))
  end

  test "should show user_app_role" do
    get :show, id: @user_app_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_app_role
    assert_response :success
  end

  test "should update user_app_role" do
    patch :update, id: @user_app_role, user_app_role: {  }
    assert_redirected_to article_path(assigns(:user_app_role))
  end

  test "should destroy user_app_role" do
    assert_difference('UserAppRole.count', -1) do
      delete :destroy, id: @user_app_role
    end

    assert_redirected_to user_app_roles_path
  end

  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @user_app_role = nil
  end
end
