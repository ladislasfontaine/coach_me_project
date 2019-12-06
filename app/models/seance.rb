class Seance < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  def start_time
    self.start_date
  end

  def welcome_send

    UserMailer.welcome_email(self).deliver_now

  end
end
