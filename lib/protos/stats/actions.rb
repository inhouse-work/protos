# frozen_string_literal: true

module Protos
  class Stats
    class Actions < Component
      # DOCS: A container for the actions (e.g. buttons) for a group of stats

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
