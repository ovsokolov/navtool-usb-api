class Navtoolsw < ApplicationRecord
  self.table_name = "navtoolsw"
  self.primary_key = "id"

  scope :active_sw, -> { where sw_valid_status: 2 }
  scope :vehicle_make, -> (vehicle_make) { where vehicle_make: vehicle_make }
  scope :vehicle_model, -> (vehicle_model) { where vehicle_model: vehicle_model }
  scope :mfg_id, -> (mfg_id) { where mfg_id: mfg_id }
  scope :manual_transmission, ->  { where vehicle_transmission: 1 }
  scope :automatic_transmission, ->  { where vehicle_transmission: [2,3] }
  scope :sw_id, ->  (sw_id) { where sw_id: sw_id }
  scope :sw_build, -> (sw_build) { where sw_build: sw_build }
end
