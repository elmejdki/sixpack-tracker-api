class MeasurementsController < ApplicationController
  before_action :set_measure, only: %i[show update destroy]

  # GET /measurements
  def index
    @measurements = current_user.measurements.all

    json_response(@measurements)
  end

  # POST /measurements
  def create
    @measurement = current_user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end

  # GET /measurements/:id
  def show
    json_response(@measurement)
  end

  # PUT /measurements/:id
  def update
    @measurement.update(measurement_params)
    if measurement_params[:image] && @measurement.image.attached?
      @measurement.update(image_url: url_for(@measurement.image))
    end
    head :no_content
  end

  # DELETE /measurements/:id
  def destroy
    @measurement.destroy
    head :no_content
  end

  private

  def measurement_params
    params.permit(
      :value,
      :measure_id
    )
  end

  def set_measure
    @measurement = current_user.measurements.find(params[:id])
  end
end
