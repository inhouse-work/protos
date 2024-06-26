# frozen_string_literal: true

module Protos
  module Typography
    class InlineLink < Component
      # DOCS: A link that is styled to be inline with text

      def view_template(&)
        a(**attrs, &)
      end

      private

      def theme
        {
          container: %w[
            font-semibold
            hover:underline
            underline-offset-4
            cursor-pointer
          ]
        }
      end
    end
  end
end
