# frozen_string_literal: true

module Protos
  class Alert
    class Actions < Component
      # DOCS: Area for actions (e.g buttons) within an alert

      def view_template(&)
        nav(**attrs, &)
      end

      private

      def theme
        {
          container: %w[
            flex
            gap-xs
            items-center
          ]
        }
      end
    end
  end
end
