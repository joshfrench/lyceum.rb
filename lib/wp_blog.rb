class WPBlog < ActiveRecord::Base
  self.primary_key = :blog_id
  has_many :registration_logs, :class_name => 'WPRegistrationLog', :foreign_key => 'blog_id'
  belongs_to :site, :class_name => 'WPSite', :foreign_key => :site_id
  
  def after_initialize
    blog_id = self.id
    
    option_class = "WP#{blog_id}Option"
    unless Kernel.const_defined?(option_class)
      Kernel.const_set(option_class, WPOption).class_eval do
        self.abstract_class = false
        set_table_name "wp_#{blog_id}_options"
      end
    end
    
    postmeta_class = "WP#{blog_id}Postmeta"
    unless Kernel.const_defined?(postmeta_class)
      Kernel.const_set(postmeta_class, WPPostmeta).class_eval do
        self.abstract_class = false
        set_table_name "wp_#{blog_id}_postmeta"
      end
    end
    
    comment_class = "WP#{blog_id}Comment"
    unless Kernel.const_defined?(comment_class)
      Kernel.const_set(comment_class, WPComment).class_eval do
        self.abstract_class = false
        set_table_name "wp_#{blog_id}_comments"
      end
    end
    
    post_class = "WP#{blog_id}Post"
    unless Kernel.const_defined?(post_class)
      Kernel.const_set(post_class, WPPost).class_eval do
        self.abstract_class = false
        set_table_name "wp_#{blog_id}_posts"
        has_many :postmeta, :class_name => postmeta_class, :foreign_key => :post_id
        has_many :comments, :class_name => comment_class, :foreign_key => :comment_post_id
      end
    end
  end
  
end