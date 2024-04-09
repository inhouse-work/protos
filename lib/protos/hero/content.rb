# frozen_string_literal: true

module Protos
  class Hero
    class Content < Component
      # DOCS: The content of a hero. This would be centered within the main
      # component container.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "hero-content"
        }
      end
    end
  end
end
