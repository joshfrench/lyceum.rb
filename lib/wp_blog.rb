class WPBlog < ActiveRecord::Base
  self.primary_key = :blog_id
  has_many :registration_logs, :class_name => 'WPRegistrationLog', :foreign_key => 'blog_id'
  belongs_to :site, :class_name => 'WPSite', :foreign_key => :site_id
end