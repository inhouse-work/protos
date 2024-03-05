# frozen_string_literal: true

module Protos
  class Hero
    class Overlay < Component
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
