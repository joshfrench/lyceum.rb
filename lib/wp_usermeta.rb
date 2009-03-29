class WPUsermeta < ActiveRecord::Base
  self.primary_key = :umeta_id
  set_table_name :wp_usermeta
end