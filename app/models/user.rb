class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  mount_uploader :avatar, AvatarUploader
  
  def favorited(post)
    favorites.where(post_id: post.id).first
  end
  
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

end
