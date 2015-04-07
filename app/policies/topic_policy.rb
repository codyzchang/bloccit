class TopicPolicy < ApplicationPolicy
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
     true
   end
 
   def create?
     user.present? && user.admin?
   end
 
   def update?
     create?
   end
end