class WPPost < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :ID
end