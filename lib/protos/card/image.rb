# frozen_string_literal: true

module Protos
  class Card
    class Image < Component
      # DOCS: A container for an image for on a card. This matches the examples
      # on daisyui which will style the <figure> tag depending on whether
      # image-overlay is present on the card.

      def template(&block)
        figure(**attrs, &block)
      end
    end
  end
end
