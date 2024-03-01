# frozen_string_literal: true

module Protos
  class Card
    class Title < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def style
        {
          container: tokens("card-title")
        }
      end
    end
  end
end
