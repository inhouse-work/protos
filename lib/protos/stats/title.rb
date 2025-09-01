# frozen_string_literal: true

module Protos
  class Stats
    # The title/label for a statistic.
    #
    # @example Basic title
    #   stats.title { "Total Revenue" }
    #
    # @example With custom styling
    #   stats.title(class: "text-sm") { "Monthly Active Users" }
    #
    # @note This component:
    #   - Typically appears above the value
    #   - Should be concise and descriptive
    #   - Can be styled independently
    class Title < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-title"
        }
      end
    end
  end
end
