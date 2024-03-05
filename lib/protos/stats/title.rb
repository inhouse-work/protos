# frozen_string_literal: true

module Protos
  class Stats
    class Title < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat-title")
        }
      end
    end
  end
end
