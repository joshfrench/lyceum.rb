class User < ActiveRecord::Base
  self.primary_key = :ID
  has_many :usermeta, :class_name => 'Usermeta', :foreign_key => :user_id, :extend => MuFu::MetaExtension
  has_many :links, :foreign_key => :link_owner, :extend => LinkExtension
  has_many :posts, :foreign_key => :post_author, :extend => PostExtension
  has_many :comments, :extend => CommentExtension

  def approved?
    user_status == '1'
  end

  def not_approved?
    user_status == '0'
  end
end