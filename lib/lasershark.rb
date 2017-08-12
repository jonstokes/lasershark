require "interactor"
require "lasershark/version"
require "lasershark/common_context"
require "lasershark/context_methods"

module Lasershark
  def self.included(base)
    Interactor.class_eval do
      def initialize(context = {})
        @context = new_context(context)
      end

      def new_context(context)
        if context_class
          context_class.build(context)
        elsif context.class.respond_to?(:build)
          context.class.build(context)
        else
          Interactor::Context.build(context)
        end
      end

      def context_class
        self.class.context_class
      end
    end

    base.class_eval do
      include Interactor
      extend ContextMethods
    end
  end
end
