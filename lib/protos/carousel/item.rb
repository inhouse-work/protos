# frozen_string_literal: true

module Protos
  class Carousel
    # A single item within a carousel
    class Item < Component

      # Renders the carousel item element.
      #
      # @yield The content block for the item content.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "carousel-item"
        }
      end
    end
  end
end
