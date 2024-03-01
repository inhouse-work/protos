# frozen_string_literal: true

module Protos
  module Typography
    class InlineLink < Component
      def template(&block)
        a(**attrs, &block)
      end

      private

      def style
        {
          container: tokens(
            "font-medium",
            "hover:underline",
            "underline-offset-4",
            "cursor-pointer"
          )
        }
      end
    end
  end
end
