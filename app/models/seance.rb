class Seance < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  def start_time
    self.start_date
  end
end
