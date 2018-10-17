class Navtoolbtl < ApplicationRecord
  self.table_name = "navtoolbtl"
  self.primary_key = "id"

  scope :mfg_id, -> (mfg_id) { where mfg_id: mfg_id }
end
