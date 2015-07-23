require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save app without nom and description" do
    app = App.new
    assert_not app.save, "Saved the app without a title and description"
  end

  test "should not save app without nom" do
    app = App.create(description: 'App description')
    assert app.valid?, "App not valided"
  end

  test "should not save app without description" do
    app = App.create(nom: 'App title')
    assert app.valid?, "App not valided"
  end

  test "should create app" do
    assert_difference('App.count') do
      post :create, app: {nom: 'Some title', description: 'test description'}
    end

    assert_redirected_to mesapps_path(assigns(:app))
    assert_equal 'App was successfully created.', flash[:notice]
  end

end
