# frozen_string_literal: true

module Protos
  class FloatingActionButton
    class OpenButton < Component
      DEFAULT_ATTRS = { role: "button", tabindex: "0" }.freeze

      def view_template(&)
        div(**attrs, &)
      end

      private

      def default_attrs = DEFAULT_ATTRS

      def theme
        {
          container: "btn"
        }
      end
    end
  end
end
