class User < ApplicationRecord
  validates :name, length: { maximum: 20 }
  has_many :posts
end
