# frozen_string_literal: true

module Protos
  class Swap
    class On < Component
      # DOCS: The on state for a swap component. This is the active state.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("swap-on")
        }
      end
    end
  end
end
