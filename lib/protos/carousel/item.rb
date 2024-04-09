# frozen_string_literal: true

module Protos
  class Carousel
    class Item < Component
      # DOCS: A single item within a carousel

      def view_template(&)
        div(**attrs, &)
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
