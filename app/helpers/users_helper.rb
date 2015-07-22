module UsersHelper

  def required_role(need_role)
    role = current_user.role
    role_name = [role.nom]

    unless (need_role & role_name) == role_name
      redirect_to root_path,:error=>"Non Permission"
    end
  end

end
