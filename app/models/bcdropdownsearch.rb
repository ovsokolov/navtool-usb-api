class Bcdropdownsearch < ApplicationRecord
  self.table_name = "bc_product_search"
  self.primary_key = "id"

  scope :vehicle_make, -> (vehicle_make) { where vehicle_make: vehicle_make }
  scope :vehicle_model, -> (vehicle_model) { where vehicle_model: vehicle_model }
  scope :vehicle_year, -> (vehicle_year) { where vehicle_year: vehicle_year }
  scope :vehicle_option, -> (vehicle_option) { where vehicle_option: vehicle_option }
end
