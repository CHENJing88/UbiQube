require 'test_helper'

class AppsControllerTest < ActionController::TestCase
fixtures :users

  setup do
    @app= apps(:ssh)
    @user=users(:jing)
  end
  # Routing test
  test "should route to app" do
    assert_routing '/apps/1', {controller: "apps", action: "show", id: "1"}
  end

  test "should get new and render correct layout" do
    get :new, user: @user
    assert_template  partial: "_new"
  end

  test "should create app" do
    assert_difference('App.count') do
      post :create, app: { nom: @app.nom, description: @app.description }
    end

    assert_redirected_to mesapps_path(assigns(:app))
    assert_equal 'App was successfully created.', flash[:notice]
  end

  test "should show app and render correct layout" do
    get :show, form: :json, id: @app, user: @user
    #assert_response :success
    assert_template  partial: "_show"
  end

  test "should get edit app" do
    get :edit, id: @app
    assert_template  partial: "_form_fonc"
  end

  test "should update app" do
    patch :update, id: @app, app: {}
    assert_redirected_to mesapps_path(@user,assigns(:app))
  end

  test "should destroy app" do
    assert_difference('App.count', -1) do
      delete :destroy , id: @app
    end
    assert_redirected_to mesapps_path(assigns(:app))
  end


  # called after every single test
  def teardown
    # as we are re-initializing @app before every test
    # setting it to nil here is not essential but I hope
    # you understand how you can use the teardown method
    @app = nil
  end
end
