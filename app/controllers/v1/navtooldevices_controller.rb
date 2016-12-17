module V1
  class NavtooldevicesController < ApplicationController
    before_action :set_navtooldevice, only: [:show, :update, :destroy]

    # GET /navtooldevices
    def index
      @navtooldevices = Navtooldevice.all

      render json: @navtooldevices
    end

    # GET /navtooldevices/1
    def show
      render json: @navtooldevice
    end

    # POST /navtooldevices
    def create
      @navtooldevice = Navtooldevice.new(navtooldevice_params)

      if @navtooldevice.save
        render json: @navtooldevice, status: :created, location: @navtooldevice
      else
        render json: @navtooldevice.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /navtooldevices/1
    def update
      @navtooldevice.update_date = Time.now.strftime("%d/%m/%Y")
      @navtooldevice.total_updates = @navtooldevice.total_updates + 1
      if @navtooldevice.update(navtooldevice_params)
        render json: @navtooldevice
      else
        render json: @navtooldevice.errors, status: :unprocessable_entity
      end
    end

    # DELETE /navtooldevices/1
    def destroy
      @navtooldevice.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_navtooldevice
        @navtooldevice = Navtooldevice.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def navtooldevice_params
        params.fetch(:navtooldevice, {})
        params.permit(:id, :sw_id, :sw_build, :vehicle_make, :vehicle_model)
      end
  end
end
