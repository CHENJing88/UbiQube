require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @appli= applications(:ubiqube)
  end
  test "should save Application" do
    app = Application.create(nom:'appli_nom',version: 1.0,uid_admin: 'appli_admin',uid_dsi: 'appli_dsi',etat_id: 1)
    assert app.save, "Saved the Application "
  end

end
