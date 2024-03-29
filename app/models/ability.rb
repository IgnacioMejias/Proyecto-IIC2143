# frozen_string_literal: true

# Ability CanCanCan for roles
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all

      elsif user.moderator?
        can :update, Product, user: user
        can :accept, Request, user: user
      end

    else
      can :show, Product, presence: true
      can :index, Product
      can :create, Request
    end
  end
end
# return unless user.present?

# can :index, Product, user: user
# can :show, Product, user: user

# Define abilities for the user here. For example:
#
#   return unless user.present?
#   can :read, :all
#   return unless user.admin?
#   can :manage, :all
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
#   can :update, Article, published: true
#
# See the wiki for details:
# https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
