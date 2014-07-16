module VRundler
  module BasicBundle
    attr_reader :completion_block

    def dont_delete(value=nil)
      @dont_delete ||= false
      @dont_delete = value || @dont_delete
    end

    def delete_existing_folder(path)
      folder = File.join(path, name.to_s)
      FileUtils.rm_rf folder unless dont_delete
    end

    def after_download(&block)
      @completion_block = block
    end

    def run_extra
      completion_block.call if completion_block
    end

    def unpack
      bundle_specific_unpack
      run_extra
    end
  end
end
