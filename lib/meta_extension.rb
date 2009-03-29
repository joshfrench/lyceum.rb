module MuFu
  module MetaExtension
    def [](meta)
      case meta
      when String, Symbol
        find_by_meta_key(meta.to_s)
      else
        super
      end
    end
  end
end