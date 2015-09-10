require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save Application" do
    app = Application.create(:ubiqube)
    assert app.save, "Saved the Application "
  end

end
