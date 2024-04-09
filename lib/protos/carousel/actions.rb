# frozen_string_literal: true

module Protos
  class Carousel
    class Actions < Component
      # DOCS: Area for actions (e.g buttons) within a carousel

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: tokens(
            "absolute",
            "flex",
            "justify-between",
            "transform",
            "-translate-y-1/2",
            "left-sm",
            "right-sm",
            "top-1/2"
          )
        }
      end
    end
  end
end
