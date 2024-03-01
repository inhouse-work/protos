# frozen_string_literal: true

module Protos
  class Command
    class Empty < Component
      def template(&block)
        li(**attrs, &block)
      end

      private

      def default_attrs
        {
          data: { "protos--command-target": "empty" }
        }
      end

      def style
        {
          container: tokens("hidden", "px-xs", "py-sm")
        }
      end
    end
  end
end
