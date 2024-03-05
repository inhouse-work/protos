# frozen_string_literal: true

module Protos
  class Stats
    class Value < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat-value")
        }
      end
    end
  end
end
