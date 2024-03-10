# frozen_string_literal: true

module Protos
  class Alert
    class Actions < Component
      # DOCS: Area for actions (e.g buttons) within an alert

      def template(&block)
        nav(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("flex", "gap-xs", "items-center")
        }
      end
    end
  end
end
