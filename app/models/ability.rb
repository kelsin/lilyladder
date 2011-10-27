class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, :all

      can :manage, Match do |match|
        match.users.include? user
      end

      can :manage, Game do |game|
        game.match.users.include? user
      end
    end
  end
end
