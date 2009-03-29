class WPSite < ActiveRecord::Base
  set_table_name :wp_site
  has_many :wp_blogs
  has_many :sitemeta, :class_name => 'WPSitemeta', :foreign_key => :site_id do
    def [](meta)
      case meta
      when String, Symbol
        find_by_meta_key(meta.to_s)
      else
        super
      end
    end
  end
end