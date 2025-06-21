# frozen_string_literal: true

module Protos
  class Stats
    class Value < Component
      # The numeric value of the statistic.
      #
      # @example Basic value
      #   stats.value { "1,234" }
      #
      # @example With currency
      #   stats.value { "$1,234.56" }
      #
      # @note This component:
      #   - Typically appears below the title
      #   - Should contain the primary numeric value
      #   - Is often styled larger/bolder than other elements

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
