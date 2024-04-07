# frozen_string_literal: true

module Protos
  class Timeline
    class Left < Component
      # DOCS: Content on the left (on daisyui "start") side of a timeline.
      # We chose not to use start/end because of the keywork conflict with ruby.

      def view_template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("timeline-start")
        }
      end
    end
  end
end
