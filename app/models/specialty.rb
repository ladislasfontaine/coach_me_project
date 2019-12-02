class Specialty < ApplicationRecord
	has_many :coach_specialties
	has_many :coaches, through: :coach_specialties
end
