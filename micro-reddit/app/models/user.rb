class User < ApplicationRecord
    has_many :posts, :comments
    validates :user_name, :email, presence: true
    validates :user_name, length: { minimum: 1 }
end
