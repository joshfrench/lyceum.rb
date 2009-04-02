class WPPost < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = :ID
  
  def after_initialize
    blog_id = self.class.table_name.scan(/\d+/).first
    
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
    
    (class << self; self; end).class_eval do
      has_many :postmeta, :class_name => postmeta_class, :foreign_key => :post_id
      has_many :comments, :class_name => comment_class, :foreign_key => :comment_post_id
    end
  end
end