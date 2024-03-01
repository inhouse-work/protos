# frozen_string_literal: true

module Protos
  class Collapse
    class Title < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("collapse-title")
        )
      end
    end
  end
end
