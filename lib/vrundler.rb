require 'fileutils'
require 'open-uri'

require 'vrundler/basic_bundle'
require 'vrundler/bundle'
require 'vrundler/bundles'
require 'vrundler/bundle_group'
require 'vrundler/vim_script_bundle'
require 'vrundler/script_type_group'
require 'vrundler/symlink_bundle'
require 'vrundler/vim_script_group'
require 'vrundler/vim_zip_bundle'
require 'vrundler/vim_zip_group'

module VRundler
  def log(message)
    puts message
  end

  def bundles_dir(path)
    Bundles.bundles_dir path
  end

  def github(name, &block)
    group("http://github.com/#{name}/", &block)
  end

  def vimscripts(&block)
    vim_script_group = VimScriptGroup.new
    vim_script_group.instance_eval(&block) if block
  end

  def vimzips(&block)
    zip_group = VimZipGroup.new
    zip_group.instance_eval(&block) if block
  end

  def symlink(destination_folder_key, source_path)
    bundle = SymlinkBundle.new(destination_folder_key, source_path)
    Bundles << bundle
    yield bundle, Bundles if block_given?
    bundle
  end

  :private
    def group(name, &block)
      group = BundleGroup.new(name)
      group.instance_eval(&block)
    end
end

include VRundler
