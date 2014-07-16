module VRundler
  class SymlinkBundle
    include BasicBundle

    attr_reader :name
    attr_reader :source_folder

    def initialize(name, source_folder)
      @name = name.to_s
      @source_folder = source_folder
    end

    def bundle_specific_unpack
      system("ln -s #{source_folder} #{name}") 
    end
  end
end
