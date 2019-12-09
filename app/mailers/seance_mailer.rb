class SeanceMailer < ApplicationMailer


      default from: 'no-reply@coach-me.fr'

      def seance_email(seance)
        @user = user
        @coach = coach
        @url = 'http://localhost:3000/coaches/sign_in'

        mail(to: @user.email, subject: 'Votre séance est réservée avec @coach !')
        #mail(to: @coach.email, subject: 'Votre séance est réservée avec @user !')
      end

end
