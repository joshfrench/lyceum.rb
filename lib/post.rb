class Post < ActiveRecord::Base
  self.primary_key = :ID
  has_many :postmeta, :class_name => 'Postmeta'
  has_many :comments, :foreign_key => :comment_post_ID
  belongs_to :blog
  belongs_to :user, :foreign_key => :post_author
end