require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "assigned user_app_roles" do
    user=User.create(nom:'user_nom',provider: 'CAS',uid: 'uid')
    app=App.create(nom: 'app_nom',niveau: 'Font',description: 'Web HTTP',etat_app_id: 1,etape_app_id: 2)
    role=Role.create(nom:'role_nom')
    assert_empty user.user_app_roles
    assert_empty app.user_app_roles
    assert_empty role.user_app_roles

    user.user_app_roles.create(app_id:app.id, role_id: role.id)

    assert_equal 1, app.user_app_roles.size
    assert_equal 1, role.user_app_roles.size
  end



end
