class Specialty < ApplicationRecord
	has_many :coach_specialies
	has_many :coaches, through: :coach_specialies
end
