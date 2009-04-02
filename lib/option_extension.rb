module OptionExtension
  def [](option)
    find_by_sql(["SELECT * FROM wp_?_options WHERE option_name = ?", proxy_owner.id, option.to_s]).first
  end
end