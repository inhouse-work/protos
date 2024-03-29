# frozen_string_literal: true

module Protos
  class Timeline
    class Right < Component
      # DOCS: Content on the right (on daisyui "end") side of a timeline.
      # We chose not to use start/end because of the keywork conflict with ruby.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("timeline-end")
        }
      end
    end
  end
end
