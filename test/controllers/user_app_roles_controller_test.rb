require 'test_helper'

class UserAppRolesControllerTest < ActionController::TestCase
fixtures :users
  setup do
    @user = users(:jing)
    @user_app_role = @user.user_app_roles.build(:one)
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

  test "should create UserAppRole" do
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

  end
  test "associated user_app_roles should be destroyed" do
      @user.save
      @user.user_app_roles.create!(role_id: 1,app_id:2)
      assert_difference('UserAppRole.count', -1) do
        @user.destroy
      end
    end
  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @user_app_role = nil
  end
end
