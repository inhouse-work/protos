# frozen_string_literal: true

module Protos
  class Stats
    class Actions < Component
      # A container for interactive elements related to the statistic.
      #
      # @example With single button
      #   stats.actions { button { "View Details" } }
      #
      # @example With multiple actions
      #   stats.actions do
      #     button { "Export" }
      #     button { "Share" }
      #   end
      #
      # @note This component:
      #   - Typically appears at the bottom of the stat
      #   - Can contain buttons, links, or other interactive elements
      #   - Handles proper spacing between actions

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-actions"
        }
      end
    end
  end
end
