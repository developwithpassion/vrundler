module VRundler
  class VimZipBundle
    include BasicBundle

    attr_reader :name,
      :id

    def initialize(name, id)
      @name = name
      @id = id
    end

    def windows?
      RUBY_PLATFORM =~ /(mingw|cyg)/
    end

    def linux?
      RUBY_PLATFORM =~ /linux/
    end

    def create_unzip_command
      command = "curl #{url}"

      if windows? || linux?
        command += " > #{zip_file}"
      else
        command += " | tar -xv"
      end
    end

    def zip_file
      "#{name}.zip"
    end

    def bundle_specific_unpack
      log " Downloading zip: [#{name}]"

      folder_name = Bundles.bundle_folder(name)

      FileUtils.mkdir_p(folder_name)

      Dir.chdir(folder_name) do
        command = create_unzip_command

        `#{command}`
        `unzip #{zip_file}` if windows?
        `gunzip #{zip_file}` if linux?
        `rm #{zip_file}` if windows? || linux?
      end
    end

    def url
      "http://www.vim.org/scripts/download_script.php?src_id=#{id}"
    end
  end
end
