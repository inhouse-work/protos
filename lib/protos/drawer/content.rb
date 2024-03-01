# frozen_string_literal: true

module Protos
  class Drawer
    class Content < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("drawer-content")
        )
      end
    end
  end
end
