class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :projects
  has_many :posts

  accepts_nested_attributes_for :projects, :posts

  def username
    return email.split("@")[0].capitalize
  end       
end
