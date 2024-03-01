# frozen_string_literal: true

module Protos
  class Card
    class Actions < Component
      def template(&block)
        nav(**attrs, &block)
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
