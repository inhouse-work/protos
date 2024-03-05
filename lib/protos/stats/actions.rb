# frozen_string_literal: true

module Protos
  class Stats
    class Actions < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat-actions")
        }
      end
    end
  end
end
