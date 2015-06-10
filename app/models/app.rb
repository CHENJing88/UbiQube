class App < ActiveRecord::Base
has_and_belongs_to_many :usr
has_and_belongs_to_many :role

end
