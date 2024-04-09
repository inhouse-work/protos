# frozen_string_literal: true

module Protos
  class Stats
    class Value < Component
      # DOCS: A value for a single stat

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-value"
        }
      end
    end
  end
end
