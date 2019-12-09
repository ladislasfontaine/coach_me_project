class Coach < ApplicationRecord
  after_create :default_city
  after_create :welcome_send

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


  def default_city
    @city = City.first
    self.update(city: @city)
  end


  #MAILER
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

 #SEARCHBAR
 def self.search(search)
   if search
     where(["first_name LIKE ?","%#{search}%"])
     where(["address LIKE ?","%#{search}%"])
     #where(["price LIKE ?","%#{search}%"])
   else
      all
   end

 end



end
