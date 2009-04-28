class Post < ActiveRecord::Base
  self.primary_key = :ID
  has_many :postmeta, :class_name => 'Postmeta'
  has_many :comments, :foreign_key => :comment_post_ID
end