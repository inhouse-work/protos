# frozen_string_literal: true

module Protos
  class Alert
    class Actions < Component
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
