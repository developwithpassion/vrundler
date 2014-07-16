module VRundler
  class Bundles
    class << self
      def bundles
        @bundles ||= []
      end

      def add(bundle)
        bundles << bundle
      end
      alias :<< :add

      def bundles_dir(name=nil)
        @name = (name || @name)
      end

      def bundle_folder(name)
        return File.join(bundles_dir, name)
      end

      def output_folder(bundle)
        return bundle_folder(bundle.name)
      end

      def each(&block)
        bundles.each(&block)  
      end

      def unpack_all_bundles
        each do |bundle|
          bundle.delete_existing_folder(File.expand_path(Bundles.bundles_dir))
          bundle.unpack
        end
      end
    end
  end
end
