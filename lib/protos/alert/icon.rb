# frozen_string_literal: true

module Protos
  class Alert
    # Icon for the alert, usually showing at the top left corner aligned
    # to the text
    class Icon < Component
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
