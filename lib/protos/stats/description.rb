# frozen_string_literal: true

module Protos
  class Stats
    class Description < Component
      # DOCS: A description for a group of stats

      def view_template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat-desc")
        }
      end
    end
  end
end
