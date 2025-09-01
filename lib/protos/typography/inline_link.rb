# frozen_string_literal: true

module Protos
  module Typography
    # A link that is styled to be inline with text
    class InlineLink < Component
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
