require 'net/ftp'
require 'base64'
module V1
  class NavtoolswsController < ApplicationController
    before_action :set_navtoolsw, only: [:show, :update, :destroy]

    # GET /navtoolsws
    def index
      #@navtoolsws = Navtoolsw.all
      #render json: @navtoolsws
      @navtoolsw = Navtoolsw.where(nil)
      @navtoolsw = @navtoolsw.active_sw if params[:sw_active].present?
      @navtoolsw = @navtoolsw.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
      @navtoolsw = @navtoolsw.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
      @navtoolsw = @navtoolsw.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      @navtoolsw = @navtoolsw.automatic_transmission() if !(params[:manual_transmission].present?)
      @navtoolsw = @navtoolsw.manual_transmission() if params[:manual_transmission].present?
      @navtoolsw = @navtoolsw.where("vehicle_year_from <= ? AND vehicle_year_to >= ?",params[:vehicle_year], params[:vehicle_year]) if params[:vehicle_year].present?
      render json: @navtoolsw

    end

    # GET /navtoolsws/1
    def show
      render json: @navtoolsw
    end

    # POST /navtoolsws
    def create
      @navtoolsw = Navtoolsw.new(navtoolsw_params)

      if @navtoolsw.save
        render json: @navtoolsw, status: :created, location: @navtoolsw
      else
        render json: @navtoolsw.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /navtoolsws/1
    def update
      if @navtoolsw.update(navtoolsw_params)
        render json: @navtoolsw
      else
        render json: @navtoolsw.errors, status: :unprocessable_entity
      end
    end

    # DELETE /navtoolsws/1
    def destroy
      @navtoolsw.destroy
    end

    def make
      @navtoolsw = Navtoolsw.where(nil)
      @navtoolsw = @navtoolsw.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
      @navtoolsw = @navtoolsw.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      @navtoolsw = @navtoolsw.select('DISTINCT vehicle_make as make_id, vehicle_make')
      render json: @navtoolsw
    end

    def model
      @navtoolsw = Navtoolsw.where(nil)
      @navtoolsw = @navtoolsw.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
      @navtoolsw = @navtoolsw.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      @navtoolsw = @navtoolsw.select('DISTINCT vehicle_model as model_id, vehicle_model')
      render json: @navtoolsw
    end

    def sw
      @navtoolsw = Navtoolsw.where(nil)
      @navtoolsw = @navtoolsw.active_sw
      @navtoolsw = @navtoolsw.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
      @navtoolsw = @navtoolsw.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
      @navtoolsw = @navtoolsw.mfg_id(params[:mfg_id]) if params[:mfg_id].present?
      @navtoolsw = @navtoolsw.where("vehicle_year_from <= ? AND vehicle_year_to >= ?",params[:vehicle_year], params[:vehicle_year]) if params[:vehicle_year].present?
      render json: @navtoolsw
    end

    def ftpload
      sw_id = params[:sw_id]
      navtoolsw = Navtoolsw.find(sw_id)
      ftp = Net::FTP.new(ENV["FTP_SERVER"])
      ftp.passive = true
      ftp.login ENV["FTP_USERNAME"], ENV["FTP_PASSWORD"]

      files = ftp.chdir(navtoolsw.sw_path)
      file = ftp.getbinaryfile(navtoolsw.sw_filename, nil, navtoolsw.SW_LENGTH)
      content = Base64.strict_encode64(file)
      ftp.close
      result = {}
      result['file'] =  content
      result['size'] = navtoolsw.SW_LENGTH
      result['name'] = navtoolsw.sw_filename
      result['md5'] = navtoolsw.SW_MD5
      result['sw_id'] = navtoolsw.sw_id
      result['sw_build'] = navtoolsw.sw_build
      result['vehicle_make'] = navtoolsw.vehicle_make
      result['vehicle_model'] = navtoolsw.vehicle_model
      render json: result
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_navtoolsw
        @navtoolsw = Navtoolsw.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def navtoolsw_params
        params.fetch(:navtoolsw, {})
      end
  end
end
