#============================================================================
# CanCanCan ability model describes authorizations for a user
#
class Ability
  include CanCan::Ability

  def initialize(user)
    if user != nil
      if user.admin?
        can :manage, :all
      else
        can :update, User, :id => user.id
        can [:read, :update], Account, :user_id => user.id
      end
    end
  end
end
