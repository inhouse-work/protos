# frozen_string_literal: true

module Protos
  class Swap
    class On < Component
      # The content that displays when the swap is in the "on" state.
      #
      # @example Basic usage
      #   swap.on { "Active State" }
      #
      # @example With custom styling
      #   swap.on(class: "text-success") { icon(:check) }
      #
      # @note This component:
      #   - Only shows when the swap is toggled on
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
          container: "swap-on"
        }
      end
    end
  end
end
