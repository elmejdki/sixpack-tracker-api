class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value

  belongs_to :measure
end
