# frozen_string_literal: true

module Protos
  class Hero
    class Overlay < Component
      # DOCS: The overlay of a hero. This would be used with images to reduce
      # their opacity through the opacity of the overlay. This can be useful to
      # make text readable on noisy images.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("hero-overlay")
        }
      end
    end
  end
end
