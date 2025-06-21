# frozen_string_literal: true

module Protos
  class Drawer
    # The content of a drawer. This would be visible at all times and
    # represents the main content of your page.
    class Content < Component
      # Renders the drawer content container.
      #
      # @yield The content block for the main content.
      # @return [nil] outputs to the @buffer
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
