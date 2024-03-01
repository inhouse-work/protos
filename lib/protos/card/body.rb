# frozen_string_literal: true

module Protos
  class Card
    class Body < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("card-body")
        )
      end
    end
  end
end
