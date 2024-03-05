# frozen_string_literal: true

module Protos
  class Stats
    class Figure < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat-figure")
        }
      end
    end
  end
end
