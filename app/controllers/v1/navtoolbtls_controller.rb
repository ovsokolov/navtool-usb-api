module V1
  class NavtoolbtlsController < ApplicationController
    before_action :set_navtoolbtl, only: [:show, :update, :destroy]

    # GET /navtoolbtls
    def index
      @navtoolbtls = Navtoolbtl.where(nil)
      @navtoolbtls = @navtoolbtls.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      render json: @navtoolbtls
    end

    # GET /navtoolbtls/1
    def show
      render json: @navtoolbtl
    end

    # POST /Navtoolbtls
    def create
      @navtoolbtl = Navtoolbtl.new(navtoolbtl_params)

      if @navtoolbtl.save
        render json: @navtoolbtl, status: :created, location: @navtoolbtl
      else
        render json: @navtoolbtl.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /navtoolbtls/1
    def update
      #p = navtoolhw_params
      #puts p.inspect
      #puts params[:hw_class_description]
      #@navtoolhw.hw_class_description = params[:hw_class_description]
      if @navtoolbtl.update(navtoolbtl_params)
        render json: @navtoolbtl
      else
        render json: @navtoolbtl.errors, status: :unprocessable_entity
      end
    end

    # DELETE /navtoolhws/1
    def destroy
      @navtoolbtl.destroy
    end




      # Use callbacks to share common setup or constraints between actions.
      def set_navtoolbtl
        @navtoolhw = Navtoolbtl.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def navtoolbtl_params
        params.fetch(:navtoolbtl, {})
      end
  end
end
