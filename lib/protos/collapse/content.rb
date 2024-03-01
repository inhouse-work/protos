# frozen_string_literal: true

module Protos
  class Collapse
    class Content < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def style
        {
          container: tokens("collapse-content")
        }
      end
    end
  end
end
