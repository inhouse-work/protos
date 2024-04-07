# frozen_string_literal: true

module Protos
  class Collapse
    class Content < Component
      # DOCS: The content of a collapse. This would be hidden until the collapse
      # is opened.

      def view_template(&block)
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
