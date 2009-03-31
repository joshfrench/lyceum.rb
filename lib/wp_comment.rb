class WPComment < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :comment_ID
end