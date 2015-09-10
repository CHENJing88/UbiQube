require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "assigned user_app_roles" do
    user=User.creat(:jing)
    app=App.create(:http)
    role=Role.create(:rt)
    assert_empty user.user_app_roles
    assert_empty app.user_app_roles
    assert_empty role.user_app_roles

    user.user_app_roles.create(app_id:app.id, role_id: role.id)

    assert_equal 1, app.user_app_roles.size
    assert_equal 1, role.user_app_roles.size
  end



end
