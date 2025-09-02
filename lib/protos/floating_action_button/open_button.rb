# frozen_string_literal: true

module Protos
  class FloatingActionButton
    class OpenButton < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def default_attrs
        {
          role: "button",
          tabindex: "0"
        }
      end

      def theme
        {
          container: "btn"
        }
      end
    end
  end
end
