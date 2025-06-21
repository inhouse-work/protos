# frozen_string_literal: true

module Protos
  class Card
    # The title of a card
    class Title < Component
      # Renders the card title element.
      #
      # @yield The content block for the title text.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "card-title"
        }
      end
    end
  end
end
