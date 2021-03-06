require File.expand_path("../../test_helper", __FILE__)

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @app= apps(:http)
    @user=users(:jing)
  end
  test "should save app with nom and description" do
    app = App.create(nom:@app.nom,description:@app.description)
    assert app.save, "Saved the app with a title and a description"
  end

  test "should not save app without nom and description" do
    app = App.new
    assert_not app.save, "Saved the app without a title and description"
  end

  test "should not save app without nom" do
    app = App.create(description: 'App description')
    assert_not app.valid?, "App not valided"
  end

  test "should not save app without description" do
    app = App.create(nom: 'App title')
    assert_not app.valid?, "App not valided"
  end

end
