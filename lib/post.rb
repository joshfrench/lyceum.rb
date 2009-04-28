class Post < ActiveRecord::Base
  self.primary_key = :ID
  has_many :postmeta, :class_name => 'Postmeta'
  has_many :comments, :foreign_key => :comment_post_ID, :extend => CommentExtension
  belongs_to :blog
  belongs_to :user, :foreign_key => :post_author
  acts_as_tree :foreign_key => :post_parent, :order => 'post_date_gmt ASC'
  acts_as_list :column => :menu_order, :scope => :blog_id

  def post_status
    if self[:post_status] == 'inherit'
      (parent && parent.post_status) or nil
    else
      self[:post_status]
    end
  end
  
  %w(draft publish).each do |method|
    define_method "#{method}?" do
      self.post_status == method
    end
  end
  
  %w(post page revision).each do |method|
    define_method "#{method}?" do
      self.post_type == method
    end
  end
  
  def ping_open?
    ping_status == 'open'
  end
  
  def ping_closed?
    ping_status == 'closed'
  end
  
  def comment_open?
    comment_status == 'open'
  end
  
  def comment_closed?
    comment_status == 'closed'
  end

end