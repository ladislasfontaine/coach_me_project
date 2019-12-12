# frozen_string_literal: true

class Seance < ApplicationRecord
  belongs_to :user
  belongs_to :coach

  def start_time
    start_date
  end
end
