# frozen_string_literal: true

module Protos
  class Alert
    # Area for actions (e.g buttons) within an alert
    class Actions < Component
      def view_template(&)
        nav(**attrs, &)
      end

      private

      def default_attrs
        {
          aria_label: "alert-actions"
        }
      end

      def theme
        {
          container: "flex gap-xs items-center"
        }
      end
    end
  end
end
