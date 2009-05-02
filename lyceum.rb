$: << "lib"
require 'rubygems'
require 'activerecord'
require 'active_record/acts/tree'
require 'active_record/acts/list'
ActiveRecord::Base.send :include, ActiveRecord::Acts::Tree
ActiveRecord::Base.send :include, ActiveRecord::Acts::List

Dir.glob(File.join(%w(. lib *extension.rb))).each { |f| require_dependency f }
Dir.glob(File.join(%w(. lib *.rb))).each { |f| require_dependency f }

# FOR DEVELOPMENT
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host => 'localhost',
  :database => 'lyceum',
  :user => 'root'
)