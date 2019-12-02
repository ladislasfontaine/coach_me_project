class Coach < ApplicationRecord
	belongs_to :city, optional: true
	has_many :coach_specialies
	has_many :specialties, through: :coach_specialies
end
