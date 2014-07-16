module VRundler
  class VimScriptBundle
    include BasicBundle

    attr_reader :name,
      :script_type,
      :id

    def initialize(name, type, id)
      @name = name
      @script_type = type
      @id = id
    end

    def bundle_specific_unpack
      log " Downloading script: [#{name}]"

      local_file = File.join(name, script_type, "#{name}.vim")

      FileUtils.mkdir_p(File.dirname(local_file))

      File.open(local_file, "w") do |file|
        file << open(url).read
      end
    end

    def url
      "http://www.vim.org/scripts/download_script.php?scr_id=#{self.id}"
    end
  end
end
