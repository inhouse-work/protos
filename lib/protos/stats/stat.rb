# frozen_string_literal: true

module Protos
  class Stats
    class Stat < Component
      # A container for a single statistic with title, value and optional
      # elements.
      #
      # @example Basic stat
      #   stats.stat do
      #     stats.title { "Users" }
      #     stats.value { "1,234" }
      #   end
      #
      # @example Stat with all elements
      #   stats.stat do
      #     stats.figure { icon(:users) }
      #     stats.title { "Active Users" }
      #     stats.value { "1,234" }
      #     stats.description { "10% increase" }
      #     stats.actions { button { "View" } }
      #   end
      #
      # @note This component:
      #   - Serves as the container for all stat elements
      #   - Can contain any combination of figure, title, value, description
      #     and actions
      #   - Handles proper spacing between elements

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat"
        }
      end
    end
  end
end
