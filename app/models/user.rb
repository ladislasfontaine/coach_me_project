class User < ApplicationRecord
  belongs_to :city
  belongs_to :objective
  has_many :data
  has_many :coaches, through: :seance
end
