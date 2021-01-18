class MeasureSerializer < ActiveModel::Serializer
  attributes :id, :title, :unit, :image_url, :video
end
