# frozen_string_literal: true

module Protos
  class Command
    # A single option within a command
    class Item < Component
      # Renders the command item element.
      #
      # @yield The content block for the item content.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li(**attrs, &)
      end

      private

      def default_attrs
        {
          data: {
            "protos--command-target": "item",
            action: "turbo:submit-end->protos--modal#handleFormSubmit"
          }
        }
      end
    end
  end
end
