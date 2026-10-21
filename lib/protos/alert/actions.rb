# frozen_string_literal: true

module Protos
  class Alert
    # Area for actions (e.g buttons) within an alert
    class Actions < Component
      DEFAULT_ATTRS = { aria_label: "alert-actions" }.freeze

      def view_template(&)
        nav(**attrs, &)
      end

      private

      def default_attrs = DEFAULT_ATTRS

      def theme
        {
          container: "flex gap-xs items-center"
        }
      end
    end
  end
end
