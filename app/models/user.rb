class User < ApplicationRecord
  belongs_to :city
  belongs_to :objective
  has_many :data
end
