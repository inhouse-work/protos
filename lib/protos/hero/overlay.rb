# frozen_string_literal: true

module Protos
  class Hero
    # The overlay of a hero. This would be used with images to reduce
    # their opacity through the opacity of the overlay. This can be useful to
    # make text readable on noisy images.
    class Overlay < Component

      # Renders the hero overlay element.
      #
      # @yield The content block for the overlay (usually empty).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "hero-overlay"
        }
      end
    end
  end
end
