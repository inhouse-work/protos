# frozen_string_literal: true

module Protos
  class Timeline
    class Item < Component
      # A single item in a timeline, containing left, center and right sections.
      #
      # @example Basic item
      #   timeline.item do
      #     timeline.left { "2023" }
      #     timeline.center { "●" }
      #     timeline.right { "First Release" }
      #   end
      #
      # @example With custom styling
      #   timeline.item(class: "my-timeline-item") do
      #     timeline.left(class: "text-primary") { "2024" }
      #     timeline.center { icon(:star) }
      #     timeline.right { "Major Update" }
      #   end
      #
      # @note This component:
      #   - Represents a single event/milestone in the timeline
      #   - Should contain left, center and right components
      #   - Handles proper spacing between items
      #   - Inherits vertical/horizontal orientation from parent Timeline

      def view_template(&)
        li(**attrs, &)
      end
    end
  end
end
