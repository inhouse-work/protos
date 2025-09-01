# frozen_string_literal: true

module Protos
  class Stats
    # An optional decorative element for a stat, typically an icon or image.
    #
    # @example With icon
    #   stats.figure { icon(:users) }
    #
    # @example With image
    #   stats.figure { img(src: "chart.png") }
    #
    # @note This component:
    #   - Is positioned to the left of the stat content
    #   - Should be used for visual indicators
    #   - Inherits size from parent stat
    class Figure < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-figure"
        }
      end
    end
  end
end
