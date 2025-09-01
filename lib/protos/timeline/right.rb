# frozen_string_literal: true

module Protos
  class Timeline
    # Content on the right side of a timeline item (typically event details).
    #
    # @example Basic usage
    #   timeline.right { "Product Launch" }
    #
    # @example With rich content
    #   timeline.right do
    #     h3 { "Version 2.0" }
    #     p { "Major feature release" }
    #   end
    #
    # @note This component:
    #   - Aligns to the right in horizontal timelines
    #   - Appears below content in vertical timelines
    #   - Uses "timeline-end" class internally (avoiding Ruby's 'end' keyword)
    #   - Can contain more detailed content than left side
    class Right < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "timeline-end"
        }
      end
    end
  end
end
