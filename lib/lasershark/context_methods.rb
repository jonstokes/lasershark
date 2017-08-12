module Lasershark
  module ContextMethods
    def context_with(klass)
      @context_class = klass
    end

    def context_class
      @context_class
    end
  end
end