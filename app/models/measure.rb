class Measure < ApplicationRecord
  has_one_attached :image

  has_many :measurements

  validates_presence_of :title, :unit, :video
end
