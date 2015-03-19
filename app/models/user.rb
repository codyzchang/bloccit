class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
  
 def member?
    role = 'member'
 end
  
 def user?
    role = 'user'
 end
  
  has_many :posts
  
  
  
end
