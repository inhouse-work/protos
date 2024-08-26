# frozen_string_literal: true

module Protos
  class Alert
    class Actions < Component
      # DOCS: Area for actions (e.g buttons) within an alert

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
