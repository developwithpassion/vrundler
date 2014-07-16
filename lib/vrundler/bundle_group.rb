module VRundler
  class BundleGroup
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bundle(*names)
      names.each do |name|
        instance = Bundle.new(name, self)
        yield instance, Bundles if block_given?
        Bundles << instance
      end
    end
  end
end
