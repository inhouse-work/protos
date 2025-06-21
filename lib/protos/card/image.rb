# frozen_string_literal: true

module Protos
  class Card
    # A container for an image on a card. This matches the examples
    # on daisyui which will style the <figure> tag depending on whether
    # image-overlay is present on the card.
    class Image < Component
      # Renders the card image container.
      #
      # @yield The content block for the image content.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        figure(**attrs, &)
      end
    end
  end
end
