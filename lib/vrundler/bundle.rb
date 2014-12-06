module VRundler
  class Bundle
    include BasicBundle

    attr_reader :owner
    attr_reader :name

    def initialize(name, owner)
      @name = name
      @owner = owner
    end

    def bundle_specific_unpack
      puts "Unpacking #{url} into #{name}"
      `git clone #{url} #{name}`
    end

    def url
      "#{owner.name}#{name}"    
    end
  end
end
