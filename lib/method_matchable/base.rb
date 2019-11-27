module MethodMatchable
  module Base
    def deconstruct_keys(keys)
      keys.each_with_object({}) { |k, h| h[k] = send(k) }
    end
  end
end
