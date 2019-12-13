# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'no-reply@coach-me.fr'

  def welcome_email(user)
    @user = user
    @url = 'https://coachme.herokuapp.com/users/sign_in'

    mail(to: @user.email, subject: 'Bienvenue chez CoachMe !')
  end
end
