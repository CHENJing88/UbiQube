require 'test_helper'

class UserGroupeUsersControllerTest < ActionController::TestCase
  setup do
    @user_groupe_user = user_groupe_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_groupe_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_groupe_user" do
    assert_difference('UserGroupeUser.count') do
      post :create, user_groupe_user: {  }
    end

    assert_redirected_to user_groupe_user_path(assigns(:user_groupe_user))
  end

  test "should show user_groupe_user" do
    get :show, id: @user_groupe_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_groupe_user
    assert_response :success
  end

  test "should update user_groupe_user" do
    patch :update, id: @user_groupe_user, user_groupe_user: {  }
    assert_redirected_to user_groupe_user_path(assigns(:user_groupe_user))
  end

  test "should destroy user_groupe_user" do
    assert_difference('UserGroupeUser.count', -1) do
      delete :destroy, id: @user_groupe_user
    end

    assert_redirected_to user_groupe_users_path
  end

  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @user_groupe_user = nil
  end
end
