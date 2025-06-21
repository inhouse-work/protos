# frozen_string_literal: true

module Protos
  class Command
    # A trigger is a button that opens a command palette modal
    class Trigger < Component

      # Renders the command trigger button.
      #
      # @yield The content block for the button content.
      # @return [nil] outputs to the @buffer
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
