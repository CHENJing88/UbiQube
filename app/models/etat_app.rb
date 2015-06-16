class EtatApp < ActiveRecord::Base
  belongs_to :etat_collection, :polymorphic=>true
end
