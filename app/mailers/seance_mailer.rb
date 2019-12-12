# frozen_string_literal: true

class SeanceMailer < ApplicationMailer
  default from: 'no-reply@coach-me.fr'

  def seance_validate(user, seance)
    @user = user
    @seance = seance
    @url = 'http://localhost:3000/coaches/sign_in'

    mail(to: @user.email, subject: 'Votre séance est réservée avec votre coach !')
    mail(to: @coach.email, subject: 'Votre séance est réservée avec votre client !')
  end
end
