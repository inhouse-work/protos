# frozen_string_literal: true

module Protos
  class Modal
    # A button that opens the modal when clicked.
    #
    # @example Basic trigger
    #   modal.trigger { "Open Modal" }
    #
    # @example Trigger with custom styling
    #   modal.trigger(class: "btn btn-primary") { "Click Me" }
    #
    # @note This component automatically adds the necessary data-action
    #   to handle opening the modal via Stimulus.
    class Trigger < Component
      def view_template(&)
        button(**attrs, &)
      end

      private

      def default_attrs
        {
          data: { action: "protos--modal#open" }
        }
      end
    end
  end
end
