class MeasurementsController < ApplicationController
  # GET /measurements
  def index
    @measurements = current_user.measurements.all.order(created_at: :DESC)
    json_response(@measurements)
  end

  # POST /measurements
  def create
    @measurements = current_user.measurements.create!(measurement_params[:measurements])
    json_response(@measurements, :created)
  end

  private

  def measurement_params
    params.permit(
      measurements: [:measure_id, :value, :created_at]
    )
  end
end
