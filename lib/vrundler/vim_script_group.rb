module VRundler
  class VimScriptGroup
    def group(script_type, &block)
      instance = ScriptTypeGroup.new(script_type.to_s)       
      instance.instance_eval(&block) if block_given?
      instance
    end
  end
end
