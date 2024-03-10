# frozen_string_literal: true

module Protos
  class Carousel
    class Item < Component
      # DOCS: A single item within a carousel

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
