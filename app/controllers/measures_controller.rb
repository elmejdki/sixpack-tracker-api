class MeasuresController < ApplicationController
  before_action :set_measure, only: %i[show update destroy]
  before_action :check_role

  # GET /measures
  def index
    @measures = Measure.all

    json_response(@measures)
  end

  # POST /measures
  def create
    @measure = Measure.create!(measure_params)
    json_response(@measure, :created)
  end

  # GET /measures/:id
  def show
    json_response(@measure)
  end

  # PUT /measures/:id
  def update
    @measure.update(measure_params)
    head :no_content
  end

  # DELETE /measures/:id
  def destroy
    @measure.destroy
    head :no_content
  end

  private

  def measure_params
    params.permit(
      :title,
      :image,
      :unit,
      :video
    )
  end

  def set_measure
    @measure = Measure.find(params[:id])
  end

  def check_role
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.role == 'admin'
  end
end
