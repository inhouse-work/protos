# frozen_string_literal: true

module Protos
  class Drawer
    class Content < Component
      # DOCS: The content of a drawer. This would be visible at all times and
      # represents the main content of your page.

      def view_template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("drawer-content")
        }
      end
    end
  end
end
