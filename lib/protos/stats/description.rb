# frozen_string_literal: true

module Protos
  class Stats
    class Description < Component
      # DOCS: A description for a group of stats

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-desc"
        }
      end
    end
  end
end
