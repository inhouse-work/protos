# frozen_string_literal: true

module Protos
  module Typography
    class Paragraph < Component
      # DOCS: A paragraph of text

      def template(&block)
        p(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens(
            "leading-relaxed",
            "[&:not(:first-child)]:mt-sm"
          )
        }
      end
    end
  end
end
