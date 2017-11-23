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
    @bcdropdownsearch = @bcdropdownsearch.select('MIN(year_start) AS year_from, MAX(year_end) AS year_to')
    render json: @bcdropdownsearch
  end

  def bc_options
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
    @bcdropdownsearch = @bcdropdownsearch.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
    @bcdropdownsearch = @bcdropdownsearch.where("year_start <= ? AND year_end >= ?",params[:vehicle_year], params[:vehicle_year]) if params[:vehicle_year].present?
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT option_1, option_1_desc, category_url')
    render json: @bcdropdownsearch
  end

  def bc_group_url
    @bcdropdownsearch = Bcdropdownsearch.where(nil)
    @bcdropdownsearch = @bcdropdownsearch.vehicle_make(params[:vehicle_make]) if params[:vehicle_make].present?
    @bcdropdownsearch = @bcdropdownsearch.vehicle_model(params[:vehicle_model]) if params[:vehicle_model].present?
    @bcdropdownsearch = @bcdropdownsearch.option_1(params[:option_1]) if params[:option_1].present?
    @bcdropdownsearch = @bcdropdownsearch.where("year_start <= ? AND year_end >= ?",params[:vehicle_year], params[:vehicle_year]) if params[:vehicle_year].present?
    @bcdropdownsearch = @bcdropdownsearch.select('DISTINCT category_url')
    render json: @bcdropdownsearch
  end

end
