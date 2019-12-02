class Coach < ApplicationRecord
	belongs_to :city
	has_many :coach_specialies
	has_many :specialties, through: :coach_specialies
end
