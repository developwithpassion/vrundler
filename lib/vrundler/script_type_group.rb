module VRundler
  class ScriptTypeGroup
    attr_reader :script_type

    def initialize(script_type)
      @script_type = script_type
    end

    def script(name, id)
      Bundles << VimScriptBundle.new(name, script_type, id)
    end
  end
end
