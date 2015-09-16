# Define abilities for the passed in user here. For example:
#
#   user ||= User.new # guest user (not logged in)
#   if user.admin?
#     can :manage, :all
#   else
#     can :read, :all
#   end
#
# The first argument to `can` is the action you are giving the user
# permission to do.
# If you pass :manage it will apply to every action. Other common actions
# here are :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on.
# If you pass :all it will apply to every resource. Otherwise pass a Ruby
# class of the resource.
#
# The third argument is an optional hash of conditions to further filter the
# objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
#
# See the wiki for details:
# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
class Ability
  include CanCan::Ability

  def initialize(user)
    user||=User.new
    alias_action :read, :list, :search, :to => :basic_read_only
    if user.blank?
      # pour les visiters qui peut parcourir tous
      can :read, :all
    elsif admin?(user)
       # admin peut gérer tous
       can :manage, :all
    elsif dsi?(user)
        # Dsi peut
        can :manage, APP, :envoie => true
        basic_app
    else
      # user normal
      can :read, :all
      # gérer le compte soi meme
      can :manage, User, :id=> user.id
      #
      can :update, App #, edit_app?(:id, user)

      basic_app
    end
  end
  protected

    def basic_app
      can :read,   App
      can :list,   App
      can :search, App
      can :create, App
      can :delete, App
    end
end
