class WPSite < ActiveRecord::Base
  set_table_name :wp_site
  has_many :wp_blogs
  has_many :sitemeta, :class_name => 'WPSitemeta', :foreign_key => :site_id do
    # Let ActiveRecord try to match a dynamic method first so we don't ever
    # step on any finders. Next, try to look up a matching record. If all else
    # fails, re-raise the original NoMethodError.
    def method_missing(method, *args, &block)
      super
    rescue NoMethodError => e
      if meta = find_by_meta_key(method.to_s) 
        meta.meta_value
      else
        raise e
      end
    end
  end
end