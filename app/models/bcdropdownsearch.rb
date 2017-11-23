class Bcdropdownsearch < ApplicationRecord
  self.table_name = "bc_product_search"
  self.primary_key = "id"

  scope :vehicle_make, -> (vehicle_make) { where vehicle_make: vehicle_make }
  scope :vehicle_model, -> (vehicle_model) { where vehicle_model: vehicle_model }
  scope :option_1, -> (option_1) { where option_1: option_1 }
end
