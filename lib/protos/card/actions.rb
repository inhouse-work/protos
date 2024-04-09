# frozen_string_literal: true

module Protos
  class Card
    class Actions < Component
      # DOCS: Area for actions (e.g buttons) within a card

      def view_template(&)
        nav(**attrs, &)
      end

      private

      def theme
        {
          container: tokens("card-actions")
        }
      end
    end
  end
end
