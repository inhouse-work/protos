# frozen_string_literal: true

module Protos
  class Alert
    class Actions < Component
      def template(&block)
        nav(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("flex", "gap-xs")
        )
      end
    end
  end
end
