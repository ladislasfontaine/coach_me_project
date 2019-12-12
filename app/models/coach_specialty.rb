# frozen_string_literal: true

class CoachSpecialty < ApplicationRecord
  belongs_to :coach
  belongs_to :specialty
end
