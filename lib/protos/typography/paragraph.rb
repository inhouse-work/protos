# frozen_string_literal: true

module Protos
  module Typography
    # A paragraph of text
    class Paragraph < Component
      option :margin, default: -> { true }

      def view_template(&)
        p(**attrs, &)
      end

      private

      def theme
        {
          container: [
            "leading-relaxed",
            ("[&:not(:first-child)]:mt-sm" if margin)
          ]
        }
      end
    end
  end
end
