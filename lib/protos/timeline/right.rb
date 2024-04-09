# frozen_string_literal: true

module Protos
  class Timeline
    class Right < Component
      # DOCS: Content on the right (on daisyui "end") side of a timeline.
      # We chose not to use start/end because of the keywork conflict with ruby.

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
