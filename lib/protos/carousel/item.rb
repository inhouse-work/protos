# frozen_string_literal: true

module Protos
  class Carousel
    class Item < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("carousel-item")
        }
      end
    end
  end
end
