# frozen_string_literal: true

module Protos
  class Hero
    # The content of a hero. This would be centered within the main
    # component container.
    class Content < Component
      # Renders the hero content container.
      #
      # @yield The content block for the hero content.
      # @return [nil] outputs to the @buffer
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
