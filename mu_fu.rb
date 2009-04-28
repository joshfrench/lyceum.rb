$: << "lib"
require 'rubygems'
require 'activerecord'
require 'active_record/acts/tree'
ActiveRecord::Base.send :include, ActiveRecord::Acts::Tree

Dir.glob(File.join(%w(. lib *.rb))).each { |f| require_dependency f }

# FOR DEVELOPMENT
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host => 'localhost',
  :database => 'lyceum',
  :user => 'root'
)