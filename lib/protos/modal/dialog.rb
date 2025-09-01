# frozen_string_literal: true

module Protos
  class Modal
    # The container for modal content that appears when triggered.
    #
    # @example Basic dialog
    #   modal.dialog do
    #     h2 { "Title" }
    #     p { "Content goes here" }
    #     modal.close_button { "Close" }
    #   end
    #
    # @example Dialog with form
    #   modal.dialog do
    #     form do
    #       input(type: :text)
    #       modal.close_button { "Cancel" }
    #     end
    #   end
    #
    # @note This component:
    #   - Uses the HTML5 <dialog> element
    #   - Has responsive styling (mobile-first)
    #   - Includes a backdrop blur effect
    #   - Centers on larger screens
    class Dialog < Component
      def view_template(&block)
        dialog(**attrs) do
          div(class: css[:modal], &block)
        end
      end

      private

      def default_attrs
        {
          data: { "protos--modal-target": "dialog" }
        }
      end

      def theme
        {
          container: %w[
            modal
            modal-bottom
            backdrop-blur-sm
            sm:modal-middle
          ],
          modal: %w[
            modal-box
            flex
            flex-col
            gap-xs
          ]
        }
      end
    end
  end
end
