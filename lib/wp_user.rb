class WPUser < ActiveRecord::Base
  self.primary_key = :ID
  has_many :usermeta, :class_name => 'WPUsermeta', :foreign_key => :user_id, :extend => MuFu::MetaExtension
end