# frozen_string_literal: true

module Protos
  module Typography
    class Paragraph < Component
      # DOCS: A paragraph of text

      option :margin, default: -> { true }

      def view_template(&)
        p(**attrs, &)
      end

      private

      def theme
        {
          container: tokens(
            "leading-relaxed",
            margin: "[&:not(:first-child)]:mt-sm"
          )
        }
      end
    end
  end
end
