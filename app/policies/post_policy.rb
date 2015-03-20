 class PostPolicy < ApplicationPolicy
   class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
      @scope = scope
    end

    def resolve
      if  user.admin? || user.moderator?
        scope.all
  #    elsif 
   #     scope.all
      elsif nil
        return "You are not an Admin"
      
      else
        scope.where(:published => true)        
    end
    end
  end

  def update?
    user.admin? or user.moderator? or not post.published?
  end

   
 end