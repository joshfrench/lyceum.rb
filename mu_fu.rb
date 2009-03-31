$: << "lib"
require 'rubygems'
require 'activerecord'
Dir.glob(File.join(%w(. lib *.rb))).each { |f| require_dependency f }

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.store_full_sti_class = true

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host => 'localhost',
  :database => 'wpmu_dev',
  :user => 'root'
)