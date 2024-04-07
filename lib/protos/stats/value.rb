# frozen_string_literal: true

module Protos
  class Stats
    class Value < Component
      # DOCS: A value for a single stat

      def view_template(&block)
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
