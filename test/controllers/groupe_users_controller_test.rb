require 'test_helper'

class GroupeUsersControllerTest < ActionController::TestCase
  setup do
    @groupe_user = groupe_users(:prod)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupe_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupe_user" do
    assert_difference('GroupeUser.count') do
      post :create, groupe_user: {  }
    end

    assert_redirected_to groupe_user_path(assigns(:groupe_user))
  end

  test "should show groupe_user" do
    get :show, id: @groupe_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupe_user
    assert_response :success
  end

  test "should update groupe_user" do
    patch :update, id: @groupe_user, groupe_user: {  }
    assert_redirected_to groupe_user_path(assigns(:groupe_user))
  end

  test "should destroy groupe_user" do
    assert_difference('GroupeUser.count', -1) do
      delete :destroy, id: @groupe_user
    end

    assert_redirected_to groupe_users_path
  end
  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @groupe_user= nil
  end
end
