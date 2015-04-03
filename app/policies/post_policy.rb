class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def resolve
      if user && (user.moderator? || user.admin?)
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end

  def index?
    user
  end
  
  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
  
end
