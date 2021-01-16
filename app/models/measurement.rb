class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :measure

  validates_presence_of :value
end
