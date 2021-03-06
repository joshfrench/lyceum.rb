class Blog < ActiveRecord::Base
  self.primary_key = :blog_id
  has_many :registration_logs
  belongs_to :site, :foreign_key => :site_id
  has_many :links, :extend => LinkExtension
  has_many :posts, :extend => PostExtension
  has_many :options do
    def [](option)
      case option
      when String, Symbol
        find_by_option_name(option.to_s)
      else
        super
      end
    end
  end
  def archived?
    archived == 1
  end
end