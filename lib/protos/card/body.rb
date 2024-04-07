# frozen_string_literal: true

module Protos
  class Card
    class Body < Component
      # DOCS: The main content area of a card

      def view_template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("card-body")
        }
      end
    end
  end
end
