class WPOption < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :option_id
end