class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	belongs_to :city, optional: true
	has_many :coach_specialies
	has_many :specialties, through: :coach_specialies
	has_many :seances
  has_many :users, through: :seances

end
