class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_many :friendships, :dependent => :destroy
  has_many :friends, through: :friendships, :dependent => :destroy
  
  has_many :notifications, :dependent => :destroy
  has_many :thumbs, :dependent => :destroy
end
