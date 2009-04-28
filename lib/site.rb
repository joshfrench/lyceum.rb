class Site < ActiveRecord::Base
  set_table_name 'site'
  has_many :blogs
  has_many :sitemeta, :class_name => 'SiteMeta', :foreign_key => :site_id, :extend => MuFu::MetaExtension
end