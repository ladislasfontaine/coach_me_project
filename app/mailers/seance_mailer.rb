class SeanceMailer < ApplicationMailer


      default from: 'no-reply@coach-me.fr'

      def welcome_email(seance)
        #@user = User.find
        @seance = seance
        #@coach = coach
        @url = 'http://localhost:3000/seances'

        mail(to: @user.email, subject: 'Votre séance est réservée!')
      end

end
