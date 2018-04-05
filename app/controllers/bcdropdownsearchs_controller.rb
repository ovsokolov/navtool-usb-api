class BcdropdownsearchsController < ApplicationController
  def bc_make
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT vehicle_make as make_id, vehicle_make')
    render json: @bcdropdownsearch
  end

  def bc_model
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT vehicle_model as model_id, vehicle_model')
    render json: @bcdropdownsearch
  end

  def bc_years
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
    @bcdropdownsearch = @bcdropdownsearch.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT vehicle_year as year_id, vehicle_year')
    render json: @bcdropdownsearch
  end

  def bc_options
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
    @bcdropdownsearch = @bcdropdownsearch.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
    @bcdropdownsearch = @bcdropdownsearch.vehicle_year(params[:vehicle_year]) if params[:vehicle_year].present?
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT vehicle_option as option_id, vehicle_option')
    render json: @bcdropdownsearch
  end


end
