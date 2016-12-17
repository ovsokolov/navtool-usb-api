module V1
  class NavtoolhwsController < ApplicationController
    before_action :set_navtoolhw, only: [:show, :update, :destroy]

    # GET /navtoolhws
    def index
      #@navtoolhws = Navtoolhw.all
      @navtoolhws = Navtoolhw.where(nil)
      @navtoolhws = @navtoolhws.hw_hid(params[:hw_hid]) if params[:hw_hid].present?
      @navtoolhws = @navtoolhws.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      render json: @navtoolhws
    end

    # GET /navtoolhws/1
    def show
      render json: @navtoolhw
    end

    # POST /navtoolhws
    def create
      @navtoolhw = Navtoolhw.new(navtoolhw_params)

      if @navtoolhw.save
        render json: @navtoolhw, status: :created, location: @navtoolhw
      else
        render json: @navtoolhw.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /navtoolhws/1
    def update
      #p = navtoolhw_params
      #puts p.inspect
      #puts params[:hw_class_description]
      #@navtoolhw.hw_class_description = params[:hw_class_description]
      if @navtoolhw.update(navtoolhw_params)
        render json: @navtoolhw
      else
        render json: @navtoolhw.errors, status: :unprocessable_entity
      end
    end

    # DELETE /navtoolhws/1
    def destroy
      @navtoolhw.destroy
    end




      # Use callbacks to share common setup or constraints between actions.
      def set_navtoolhw
        @navtoolhw = Navtoolhw.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def navtoolhw_params
        params.fetch(:navtoolhw, {})
        params.permit(:id, :hw_class_description)
      end
  end
end
