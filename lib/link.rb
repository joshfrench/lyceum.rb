class Link < ActiveRecord::Base
  self.primary_key = :link_id
  def visible?
    link_visible == 'Y'
  end
end