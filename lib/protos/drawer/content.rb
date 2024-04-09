# frozen_string_literal: true

module Protos
  class Drawer
    class Content < Component
      # DOCS: The content of a drawer. This would be visible at all times and
      # represents the main content of your page.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "drawer-content"
        }
      end
    end
  end
end
