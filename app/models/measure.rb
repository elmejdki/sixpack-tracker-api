class Measure < ApplicationRecord
  has_one_attached :image

  has_many :measurements, dependent: :destroy

  validates_presence_of :title, :unit, :video, :image
end
