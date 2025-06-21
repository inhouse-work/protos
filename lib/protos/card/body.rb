# frozen_string_literal: true

module Protos
  class Card
    # The main content area of a card
    class Body < Component
      # Renders the card body container.
      #
      # @yield The content block for the card's main content.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "card-body"
        }
      end
    end
  end
end
