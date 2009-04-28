class Blog < ActiveRecord::Base
  self.primary_key = :blog_id
  has_many :registration_logs
  belongs_to :site, :foreign_key => :site_id
  has_many :options
end