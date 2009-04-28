class User < ActiveRecord::Base
  self.primary_key = :ID
  has_many :usermeta, :class_name => 'Usermeta', :foreign_key => :user_id, :extend => MuFu::MetaExtension
  has_many :links, :foreign_key => :link_owner
  has_many :posts, :foreign_key => :post_author
end