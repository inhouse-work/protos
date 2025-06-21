# frozen_string_literal: true

module Protos
  class Timeline
    class Left < Component
      # Content on the left side of a timeline item (typically dates/times).
      #
      # @example Basic usage
      #   timeline.left { "Jan 2023" }
      #
      # @example With custom styling
      #   timeline.left(class: "font-bold") { "Q1 2024" }
      #
      # @note This component:
      #   - Aligns to the left in horizontal timelines
      #   - Appears above content in vertical timelines
      #   - Uses "timeline-start" class internally (avoiding Ruby's 'start' keyword)
      #   - Should contain relatively short content

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "timeline-start"
        }
      end
    end
  end
end
