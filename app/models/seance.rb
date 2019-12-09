class Seance < ApplicationRecord
  belongs_to :user
  belongs_to :coach
  after_create :welcome_send


  def start_time
    self.start_date
  end

  def welcome_send

    SeanceMailer.seance_email(self).deliver_now

  end
end
