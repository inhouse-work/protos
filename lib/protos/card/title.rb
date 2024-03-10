# frozen_string_literal: true

module Protos
  class Card
    class Title < Component
      # DOCS: The title of a card

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("card-title")
        }
      end
    end
  end
end
