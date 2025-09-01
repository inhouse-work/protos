# frozen_string_literal: true

module Protos
  class Toast
    # A button that closes the toast when clicked.
    #
    # @example Basic close button
    #   toast.close_button { "×" }
    #
    # @example Close button with icon
    #   toast.close_button { icon(:x_mark) }
    #
    # @note This component:
    #   - Wraps the button in a form with method=dialog
    #   - Automatically focuses when toast appears (autofocus)
    #   - Includes proper ARIA label for accessibility
    #   - Can be placed anywhere within the toast content
    #
    # @see Protos::Toast The parent toast component
    class CloseButton < Component
      def view_template(&block)
        form(method: :dialog, class: css[:form]) do
          button(
            aria_label: "close",
            autofocus: true,
            formmethod: :dialog,
            formnovalidate: true,
            **attrs,
            &block
          )
        end
      end

      private

      def theme
        {
          # NOTE: Added this because I'm noticing the form having a margin
          # with a default setup. Not sure if this is really needed.
          form: "m-0"
        }
      end
    end
  end
end
