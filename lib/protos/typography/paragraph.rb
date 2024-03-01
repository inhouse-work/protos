# frozen_string_literal: true

module Protos
  module Typography
    class Paragraph < Component
      def template(&block)
        p(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens(
            "leading-relaxed",
            "[&:not(:first-child)]:mt-sm"
          )
        )
      end
    end
  end
end
