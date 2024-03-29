# frozen_string_literal: true

module Protos
  class Hero
    class Content < Component
      # DOCS: The content of a hero. This would be centered within the main
      # component container.

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
