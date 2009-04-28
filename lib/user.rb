class User < ActiveRecord::Base
  self.primary_key = :ID
  has_many :usermeta, :class_name => 'Usermeta', :foreign_key => :user_id, :extend => MuFu::MetaExtension
end