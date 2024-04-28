# frozen_string_literal: true

module Protos
  class Alert
    class Icon < Component
      # DOCS: Icon for the alert, usually showing at the top left corner aligned
      # to the text

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "place-self-start mt-1"
        }
      end
    end
  end
end
