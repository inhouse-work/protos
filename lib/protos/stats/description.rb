# frozen_string_literal: true

module Protos
  class Stats
    class Description < Component
      # Supplemental text providing context for the statistic.
      #
      # @example Basic description
      #   stats.description { "10% increase from last month" }
      #
      # @example With trend indicator
      #   stats.description do
      #     span(class: "text-success") { icon(:arrow_up) }
      #     span { "5% from last quarter" }
      #   end
      #
      # @note This component:
      #   - Typically appears below the value
      #   - Should provide additional context/analysis
      #   - Often includes trend indicators

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-desc"
        }
      end
    end
  end
end
