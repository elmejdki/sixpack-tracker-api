class Measure < ApplicationRecord
  after_initialize :init

  has_one_attached :image

  has_many :measurements

  validates_presence_of :title, :unit, :video

  def init
    self.image_url ||= ''
  end
end
