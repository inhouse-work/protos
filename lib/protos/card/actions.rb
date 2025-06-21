# frozen_string_literal: true

module Protos
  class Card
    # Area for actions (e.g buttons) within a card
    class Actions < Component
      # Renders the card actions container.
      #
      # @yield The content block for action buttons or controls.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        nav(**attrs, &)
      end

      private

      def theme
        {
          container: "card-actions"
        }
      end
    end
  end
end
