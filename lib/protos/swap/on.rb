# frozen_string_literal: true

module Protos
  class Swap
    class On < Component
      # DOCS: The on state for a swap component. This is the active state.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "swap-on"
        }
      end
    end
  end
end
