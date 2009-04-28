class Comment < ActiveRecord::Base
  self.primary_key = :comment_ID
  belongs_to :user
  belongs_to :post, :foreign_key => :comment_post_ID, :counter_cache => :comment_count
  acts_as_tree :foreign_key => :comment_parent, :order => 'comment_date_gmt ASC'
end