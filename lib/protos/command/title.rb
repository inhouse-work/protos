# frozen_string_literal: true

module Protos
  class Command
    class Title < Component
      def template(&block)
        h2(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("menu-title")
        )
      end
    end
  end
end
