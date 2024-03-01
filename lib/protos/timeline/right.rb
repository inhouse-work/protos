# frozen_string_literal: true

module Protos
  class Timeline
    class Right < Component
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
