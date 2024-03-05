# frozen_string_literal: true

module Protos
  class Hero
    class Content < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("hero-content")
        }
      end
    end
  end
end
