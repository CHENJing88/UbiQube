require 'test_helper'

class VmsControllerTest < ActionController::TestCase
  setup do
    @vm = vms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vm" do
    assert_difference('Vm.count') do
      post :create, vm: {  }
    end

    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should show vm" do
    get :show, id: @vm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vm
    assert_response :success
  end

  test "should update vm" do
    patch :update, id: @vm, vm: {  }
    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should destroy vm" do
    assert_difference('Vm.count', -1) do
      delete :destroy, id: @vm
    end

    assert_redirected_to vms_path
  end

  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @vm = nil
  end
end
