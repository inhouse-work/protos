# frozen_string_literal: true

module Protos
  class Timeline
    class Center < Component
      # The visual marker/indicator at the center of a timeline item.
      #
      # @example With dot marker
      #   timeline.center { "●" }
      #
      # @example With icon
      #   timeline.center { icon(:check) }
      #
      # @example Custom styled
      #   timeline.center(class: "text-primary") { icon(:star) }
      #
      # @note This component:
      #   - Typically contains a simple visual marker
      #   - Connects timeline items visually
      #   - Should be kept small and simple
      #   - Uses "timeline-middle" class internally

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
