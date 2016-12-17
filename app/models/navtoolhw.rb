class Navtoolhw < ApplicationRecord
  self.table_name = "navtoolhw"
  self.primary_key = "id"

  scope :hw_hid, -> (hw_hid) { where hw_hid: hw_hid }
  scope :mfg_id, -> (mfg_id) { where mfg_id: mfg_id }
end
