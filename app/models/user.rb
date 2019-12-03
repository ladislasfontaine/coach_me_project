class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city, optional: true
  belongs_to :objective, optional: true
  has_many :data
  has_many :seances
  has_many :coaches, through: :seances
  has_one_attached :avatar
  
end
