class Favorite < ActiveRecord::Base
  has_many :post, dependent: :destroy
  has_many :user, dependent: :destroy
end
