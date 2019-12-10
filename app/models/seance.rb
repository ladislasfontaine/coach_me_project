class Seance < ApplicationRecord
  belongs_to :user
  belongs_to :coach
  after_create :seance_validate


  def start_time
    self.start_date
  end

  def seance_validate
    Seance.last.each do |seance|
    SeanceMailer.seance_validate(user, seance).deliver_now
    end
  end
end
