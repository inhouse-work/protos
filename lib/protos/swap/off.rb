# frozen_string_literal: true

module Protos
  class Swap
    class Off < Component
      # DOCS: The off state for a swap component. This is the default state.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("swap-off")
        }
      end
    end
  end
end
