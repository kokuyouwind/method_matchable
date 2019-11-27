module MethodMatchable
  module Base
    def deconstruct_keys(keys)
      keys.each_with_object(defined?(super) ? super(keys).dup : {}) do |k, h|
        h[k] = send(k) if respond_to?(k)
      end
    end
  end
end
