class Coach < ApplicationRecord
  # after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	belongs_to :city, optional: true
	has_many :coach_specialties
	has_many :specialties, through: :coach_specialties
	has_many :seances
  has_many :users, through: :seances

  has_one_attached :avatar
  has_one_attached :cover
  has_one_attached :diploma

  #MAILER
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
