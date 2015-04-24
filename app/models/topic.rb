class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length: { minimum: 5 }
  
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  
  
end
