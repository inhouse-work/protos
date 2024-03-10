# frozen_string_literal: true

module Protos
  class Stats
    class Stat < Component
      # DOCS: A single stat container

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("stat")
        }
      end
    end
  end
end
