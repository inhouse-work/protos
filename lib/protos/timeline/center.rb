# frozen_string_literal: true

module Protos
  class Timeline
    class Center < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("timeline-middle")
        )
      end
    end
  end
end
