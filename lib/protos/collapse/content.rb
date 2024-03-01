# frozen_string_literal: true

module Protos
  class Collapse
    class Content < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("collapse-content")
        }
      end
    end
  end
end
