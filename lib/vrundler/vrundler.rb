module VRundler
  def bundles_dir(path)
    Bundles.bundles_dir path
  end

  def git(user_clone_url, &block)
    group(user_clone_url, &block)
  end

  def vimscripts(&block)
    vim_script_group = VimScriptGroup.new
    configure(vim_script_group, &block)
  end

  def vimzips(&block)
    zip_group = VimZipGroup.new
    configure(zip_group, &block)
  end

  def symlink(destination_folder_key, source_path)
    bundle = SymlinkBundle.new(destination_folder_key, source_path)
    Bundles << bundle
    yield bundle, Bundles if block_given?
    bundle
  end

  :private
    def configure(item, &block)
      item.instance_eval(&block)
      item
    end

    def group(name, &block)
      item = BundleGroup.new(name)
      configure(item, &block)
    end
end
