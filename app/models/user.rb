# frozen_string_literal: true

class User < ApplicationRecord
  after_create :default_city
  after_create :default_objective
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  belongs_to :city, optional: true
  belongs_to :objective, optional: true
  has_many :data, dependent: :destroy
  has_many :seances, dependent: :destroy
  has_many :coaches, through: :seances
  has_one_attached :avatar
  has_one_attached :cover

  def default_city
    @city = City.first
    update(city: @city)
  end

  def default_objective
    @objective = Objective.first
    update(objective: @objective)
  end

  # MAILER
  def welcome_send
    UserMailer.welcome_email(self).deliver_now.inspect
  end

  def self.from_facebook(auth)
    where(facebook_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[6, 20]
      user.first_name = auth.info.name.split[0]
      user.last_name = auth.info.name.split[1]
    end
  end

  def self.from_google(auth)
    where(google_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[6, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end
end
