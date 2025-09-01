# frozen_string_literal: true

module Protos
  class Modal
    # A button that closes the modal when clicked.
    #
    # @example Basic close button
    #   modal.close_button { "Close" }
    #
    # @example Close button with icon
    #   modal.close_button { icon(:x_mark) }
    #
    # @note This component:
    #   - Wraps the button in a form with method=dialog
    #   - Automatically adds the data-action to handle closing via Stimulus
    #   - Can be placed anywhere within the modal dialog
    class CloseButton < Component
      def view_template(&block)
        form(method: :dialog, class: css[:form]) do
          button(**attrs, &block)
        end
      end

      private

      def default_attrs
        {
          data: { action: "protos--modal#close" }
        }
      end
    end
  end
end
