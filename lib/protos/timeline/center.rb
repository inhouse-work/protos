# frozen_string_literal: true

module Protos
  class Timeline
    class Center < Component
      # DOCS: The center of a timeline. This would usually be an icon or
      # something small that shows a point on the timeline.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "timeline-middle"
        }
      end
    end
  end
end
