class Labelconfig < ApplicationRecord
  self.table_name = "feature_label"
  self.primary_key = "id"

  scope :sw_id, -> (sw_id) { where sw_id: sw_id }
  scope :mfg_id, -> (mfg_id) { where mfg_id: mfg_id }
end
