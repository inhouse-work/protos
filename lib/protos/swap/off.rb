# frozen_string_literal: true

module Protos
  class Swap
    class Off < Component
      # The content that displays when the swap is in the "off" state.
      #
      # @example Basic usage
      #   swap.off { "Inactive State" }
      #
      # @example With custom styling
      #   swap.off(class: "text-error") { icon(:x_mark) }
      #
      # @note This component:
      #   - Shows by default when swap is toggled off
      #   - Can contain any content (text, icons, etc)
      #   - Inherits swap behavior from parent component
      #
      # @see Protos::Swap The parent swap component

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "swap-off"
        }
      end
    end
  end
end
