class RoleDroit < ActiveRecord::Base
  #relation many to many (role-droit)
  belongs_to :roles, class_name: "Role"
  belongs_to :droits, class_name: "Droit"

end
