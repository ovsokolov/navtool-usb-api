module V1
  class LabelconfigsController < ApplicationController
    before_action :set_labelconfig, only: [:show, :update, :destroy]

    # GET /labelconfigs
    def index
      @labelconfigs = Labelconfig.where(nil)
      @labelconfigs = @labelconfigs.sw_id(params[:sw_id]) if params[:sw_id].present?
      @labelconfigs = @labelconfigs.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      render json: @labelconfigs
    end

    # GET /labelconfigs/1
    def show
      render json: @labelconfig
    end

    # POST /labelconfigs
    def create
      @labelconfig = Labelconfig.new(labelconfig_params)

      if @labelconfig.save
        render json: @labelconfig, status: :created, location: @labelconfig
      else
        render json: @labelconfig.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /labelconfigs/1
    def update
      if @labelconfig.update(labelconfig_params)
        render json: @labelconfig
      else
        render json: @labelconfig.errors, status: :unprocessable_entity
      end
    end

    # DELETE /labelconfigs/1
    def destroy
      @labelconfig.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_labelconfig
        @labelconfig = Labelconfig.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def labelconfig_params
        params.fetch(:labelconfig, {})
      end
  end
end
