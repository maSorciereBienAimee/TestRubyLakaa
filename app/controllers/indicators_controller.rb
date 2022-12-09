class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:show, :update, :destroy]

  # GET /indicators
  def index
    if params[:status] == "active"
      @indicators = Indicator.where('active' => true)
    else
      @indicators = Indicator.all
    end
    render json: @indicators
  end

  # GET /indicators/1
  def show
    render json: @indicator
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)

    if @indicator.save
      render json: @indicator, status: :created, location: @indicator
    else
      render json: @indicator.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /indicators/1
  def update
    if @indicator.update(indicator_params)
      render json: @indicator
    else
      render json: @indicator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /indicators/1
  def destroy
    @indicator.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator
      @indicator = Indicator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def indicator_params
      params.require(:indicator).permit(:name, :active)
    end
end
