class WPSite < ActiveRecord::Base
  set_table_name :wp_site
  has_many :wp_blogs
  has_many :sitemeta, :class_name => 'WPSitemeta', :foreign_key => :site_id, :extend => MuFu::MetaExtension
end