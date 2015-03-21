class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  if user.admin? || user.moderator?
    def index?
      true
    end
  end
   
  def update?
    user.admin? or not post.published?
  end
   
end