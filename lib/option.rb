class Option < ActiveRecord::Base
  self.primary_key = :option_id

  def autoload?
    autoload == 'y'
  end
end