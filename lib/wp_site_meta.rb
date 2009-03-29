class WPSitemeta < ActiveRecord::Base
  set_table_name :wp_sitemeta
  self.primary_key = :meta_id
end