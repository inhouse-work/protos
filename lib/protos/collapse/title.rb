# frozen_string_literal: true

module Protos
  class Collapse
    class Title < Component
      # DOCS: The title of a collapse. This is the content that is always
      # visible and is used to toggle the collapse.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("collapse-title")
        }
      end
    end
  end
end
