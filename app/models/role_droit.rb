class RoleDroit < ActiveRecord::Base
  #relation many to many (role-droit)
  belongs_to :role, class_name: "Role"
  belongs_to :droit, class_name: "Droit"

end
