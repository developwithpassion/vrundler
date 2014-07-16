module VRundler
  class VimZipGroup
    def zip(symbol_or_name, id)
      Bundles << VimZipBundle.new(symbol_or_name.to_s, id)
    end
  end
end
