# frozen_string_literal: true

module Protos
  class Diff
    # The resizer element that allows dragging to adjust the split between diff items
    class Resizer < Component
      # Renders the resizer element.
      #
      # @yield The content block for the resizer (usually empty).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "diff-resizer"
        }
      end
    end
  end
end
