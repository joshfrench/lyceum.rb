class SiteMeta < ActiveRecord::Base
  set_table_name :sitemeta
  self.primary_key = :meta_id
end