# frozen_string_literal: true

module Protos
  class Card
    class Body < Component
      # DOCS: The main content area of a card

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
