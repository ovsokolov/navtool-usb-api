class Hdmidevice < ApplicationRecord
  self.table_name = "hdmisw_vw"
  self.primary_key = "id"

  scope :mfg_id, -> (mfg_id) { where mfg_id: mfg_id }
  scope :sw_id, ->  (sw_id) { where sw_id: sw_id }
  scope :sw_build, -> (sw_build) { where sw_build: sw_build }
end
