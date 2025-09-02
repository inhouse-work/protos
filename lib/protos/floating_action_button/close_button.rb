# frozen_string_literal: true

module Protos
  class FloatingActionButton
    class CloseButton < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "fab-close"
        }
      end
    end
  end
end
