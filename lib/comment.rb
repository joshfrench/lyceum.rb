class Comment < ActiveRecord::Base
  self.primary_key = :comment_ID
  belongs_to :user
  belongs_to :post, :foreign_key => :comment_post_ID, :counter_cache => :comment_count
end