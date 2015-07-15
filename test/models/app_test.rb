require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save app without title" do
    post = Post.new
    assert_not post.save, "Saved the app without a title"
  end
end
