# frozen_string_literal: true

module Protos
  class List
    class Item < Component
      def template(&block)
        li(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens(
            "join-item",
            "[&:not(:first-child)]:border-t-0"
          )
        )
      end
    end
  end
end
