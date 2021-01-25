class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at

  belongs_to :measure
end
