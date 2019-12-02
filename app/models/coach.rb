class Coach < ApplicationRecord
	belongs_to :city
	has_many :coach_specialties
	has_many :specialties, through: :coach_specialties
	has_many :users, through: :seance
end
