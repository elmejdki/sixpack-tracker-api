class MeasurementsController < ApplicationController
  before_action :set_measure, only: [:show, :update, :destroy]

  # GET /measurements
  def index
    @user = User.all.first
    @measurements = @user.measurements.all

    json_response(@measurements)
  end

  # POST /measurements
  def create
    # need to be updated to a signup method that will return a new JWT
    # TODO: update later
    @user = User.all.first
    @measurement = @user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end

  # GET /measurements/:id
  def show
    json_response(@measurement)
  end

  # PUT /measurements/:id
  def update
    @measurement.update(measurement_params)
    @measurement.update(image_url: url_for(@measurement.image)) if measurement_params[:image] && @measurement.image.attached?
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
    @user = User.all.first
    @measurement = @user.measurements.find(params[:id])
  end
end
