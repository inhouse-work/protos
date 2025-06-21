# frozen_string_literal: true

module Protos
  class Carousel
    # Area for actions (e.g buttons) within a carousel
    class Actions < Component
      # Renders the carousel actions container.
      #
      # @yield The content block for action buttons or controls.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: %w[
            absolute
            flex
            justify-between
            transform
            -translate-y-1/2
            left-sm
            right-sm
            top-1/2
          ]
        }
      end
    end
  end
end
