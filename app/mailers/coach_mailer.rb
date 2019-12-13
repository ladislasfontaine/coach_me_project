# frozen_string_literal: true

class CoachMailer < ApplicationMailer
  default from: 'no-reply@coach-me.fr'

  def welcome_email(coach)
    @coach = coach
    @url = 'https://coachme.herokuapp.com/coaches/sign_in'

    mail(to: @coach.email, subject: 'Bienvenue chez CoachMe !')
  end
end
