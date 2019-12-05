class SeanceMailer < ApplicationMailer


      default from: 'no-reply@coach-me.fr'

      def welcome_email(seance)
        #@user = User.find
        @seance = seance
        @coach = coach
        @url = 'http://localhost:3000/coaches/sign_in'

        mail(to: @user.email, subject: 'Votre séance est réservée avec @coach !')
      end

end
