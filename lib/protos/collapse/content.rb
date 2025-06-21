# frozen_string_literal: true

module Protos
  class Collapse
    # The content of a collapse. This would be hidden until the collapse
    # is opened.
    class Content < Component
      # Renders the collapse content container.
      #
      # @yield The content block for the collapsible content.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "collapse-content"
        }
      end
    end
  end
end
